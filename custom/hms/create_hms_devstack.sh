#!/bin/bash
set -x # echo on
set -e # exit when any command fails
set -u # exit when undefined variables are found
set -o pipefail # prevents errors in a pipeline from being masked

# assumption: devstack with ironwood.master has already been created with:
# export OPENEDX_RELEASE=ironwood.master; sudo -E make dev.provision
 
# avoid errors because of docker-compose HTTP timeout
export COMPOSE_HTTP_TIMEOUT=300

HMS_DEVSTACK_DIR=$(dirname $(realpath "$0"))
OPENEDX_CODE_BASE_DIR="${HMS_DEVSTACK_DIR}/../../.."
HMS_REMOTE="hms"
GIT_SERVER="git@gitlab.com"
HMS_EDX_PLATFORM_REPO="opencraft/client/harvard-medical-school/edx-platform.git" 
HMS_EDX_THEME_REPO="opencraft/client/harvard-medical-school/edx-theme.git"
HMS_BRANCH="opencraft-release/ironwood.2-hms"
HMS_THEME_DIR_NAME="hms"
export OPENEDX_RELEASE=ironwood.master

# In edx/edx-platform directory, download the HMS branch if it has not been downloaded yet and pull new commits if needed
cd ${OPENEDX_CODE_BASE_DIR}/edx-platform
if [ $(git remote | grep $HMS_REMOTE > /dev/null) ]; then
  git remote add ${HMS_REMOTE} ${GIT_SERVER}:${HMS_EDX_PLATFORM_REPO}
  git fetch ${HMS_REMOTE}
  PULL_HMS_BRANCH=false
else
  PULL_HMS_BRANCH=true
fi
git checkout ${HMS_BRANCH} 
if [ "$PULL_HMS_BRANCH" = true ]; then
  git pull ${HMS_REMOTE} ${HMS_BRANCH}
fi

# In edx/src directory, clone the theme repo under devstack_folder/src/themes:
THEMES_DIR=${OPENEDX_CODE_BASE_DIR}/src/themes 
mkdir -p ${THEMES_DIR}
cd ${THEMES_DIR}
if [ -d $HMS_THEME_DIR_NAME -a -d $HMS_THEME_DIR_NAME/.git ]; then
  cd ${HMS_THEME_DIR_NAME}
  git checkout ${HMS_BRANCH}
  git pull
else
  git clone ${GIT_SERVER}:${HMS_EDX_THEME_REPO} ${HMS_THEME_DIR_NAME}
fi

# In edx/devstack directory, bring devstack containers up
cd ${OPENEDX_CODE_BASE_DIR}/devstack
sudo -E make dev.up

# In edx/devstack directory, update Python prerequisites in CMS and LMS containers
# this is needed because the only git repository changed by HMS is edx-platform and both CMS and LMS use it
LMS_CONTAINER_ID=$(sudo docker ps -aqf "name=edx.devstack.lms")
sudo docker-compose exec lms /bin/bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PYTHON_UNINSTALL=1 && paver install_prereqs'
STUDIO_CONTAINER_ID=$(sudo docker ps -aqf "name=edx.devstack.studio")
sudo docker-compose exec studio /bin/bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PYTHON_UNINSTALL=1 && paver install_prereqs'

# inside the devstack container, update Django settings at /edx/app/edxapp/lms.env.json, Django site theme and Django site configuration:
cd ${HMS_DEVSTACK_DIR}
sudo docker cp set_hms_config.py ${LMS_CONTAINER_ID}:/edx
sudo docker cp settings_updates.json ${LMS_CONTAINER_ID}:/edx
sudo docker cp site_config_updates.json ${LMS_CONTAINER_ID}:/edx
cd ${OPENEDX_CODE_BASE_DIR}/devstack
sudo docker-compose exec lms /bin/bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/set_hms_config.py /edx/settings_updates.json /edx/site_config_updates.json'

# recompile static assets 
sudo docker-compose exec lms /bin/bash -c "source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets --themes=${HMS_THEME_DIR_NAME} --settings devstack_docker"

# in edx/devstack directory, restart LMS
sudo make lms-restart
