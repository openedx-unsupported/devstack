docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver install_prereqs'
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 paver update_db --settings devstack_docker'
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets --settings devstack_docker'
docker restart edx.devstack.lms
