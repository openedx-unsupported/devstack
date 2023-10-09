#!/usr/bin/env bash
set -eu -o pipefail
set -x

apps=( lms cms )

cms_port=18010

# Load database dumps for the largest databases to save time
./load-db.sh edxapp
./load-db.sh edxapp_csmh

# Bring edxapp containers online
for app in "${apps[@]}"; do
    docker compose up -d $app
done

# install git for both LMS and CMS
for app in "${apps[@]}"; do
    docker compose exec -T  $app bash -e -c 'apt-get update && apt-get -y install --no-install-recommends git'

    docker compose exec -T  $app bash -e -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PYTHON_UNINSTALL=1 paver install_prereqs'

    #Installing prereqs crashes the process
    docker compose restart $app
done

# Run edxapp migrations first since they are needed for the service users and OAuth clients
# Make migrate runs migrations for both lms and cms.
docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && make migrate'

docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && /edx/app/edxapp/venvs/edxapp/bin/python /edx/app/edxapp/edx-platform/manage.py lms showmigrations --database student_module_history --traceback --pythonpath=. --settings devstack_docker'
docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && /edx/app/edxapp/venvs/edxapp/bin/python /edx/app/edxapp/edx-platform/manage.py lms migrate --database student_module_history --noinput --traceback --pythonpath=. --settings devstack_docker'

docker compose exec -T cms bash -e -c 'source /edx/app/edxapp/edxapp_env && /edx/app/edxapp/venvs/edxapp/bin/python /edx/app/edxapp/edx-platform/manage.py cms showmigrations --database student_module_history --traceback --pythonpath=. --settings devstack_docker'
docker compose exec -T cms bash -e -c 'source /edx/app/edxapp/edxapp_env && /edx/app/edxapp/venvs/edxapp/bin/python /edx/app/edxapp/edx-platform/manage.py cms migrate --database student_module_history --noinput --traceback --pythonpath=. --settings devstack_docker'

# Create a superuser for edxapp
docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user edx edx@example.com --superuser --staff'
docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username=\"edx\"); user.set_password(\"edx\"); user.save()" | python /edx/app/edxapp/edx-platform/manage.py lms shell  --settings=devstack_docker'

# Create an enterprise service user for edxapp and give them appropriate permissions
./enterprise/provision.sh

# Enable the LMS-E-Commerce integration
docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker configure_commerce'

# Create demo course and users
#docker compose exec -T lms bash -e -c '/edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/playbooks/demo.yml -v -c local -i "127.0.0.1," --extra-vars="COMMON_EDXAPP_SETTINGS=devstack_docker"'
if [[ ${DEVSTACK_SKIP_DEMO-false} == "true" ]]
then
    echo "Skipping import of demo course. DEVSTACK_SKIP_DEMO is set to true"
else
    docker compose exec -T lms bash -e -c 'git clone https://github.com/openedx/edx-demo-course.git /tmp/edx-demo-course'
    docker compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py cms --settings=devstack_docker import /edx/var/edxapp/data /tmp/edx-demo-course && rm -rf /tmp/edx-demo-course'
fi

demo_hashed_password='pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw='
for user in honor audit verified staff ; do
  email="$user@example.com"
  # Set staff flag for staff user
  if [[ $user == "staff" ]] ; then
    docker compose exec -T lms bash -e -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker --service-variant lms manage_user $user $email --initial-password-hash '$demo_hashed_password' --staff"
  else
    docker compose exec -T lms bash -e -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker --service-variant lms manage_user $user $email --initial-password-hash '$demo_hashed_password'"
  fi
  if [[ "${DEVSTACK_SKIP_DEMO-false}" != "true" ]]
  then
  # Enroll users in the demo course
      docker compose exec -T lms bash -e -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker --service-variant lms enroll_user_in_course -e $email -c course-v1:edX+DemoX+Demo_Course"
  fi
done


# Fix missing vendor file by clearing the cache
docker compose exec -T  lms bash -e -c 'rm /edx/app/edxapp/edx-platform/.prereqs_cache/Node_prereqs.sha1'

# Create static assets for both LMS and CMS
for app in "${apps[@]}"; do
    docker compose exec -T  $app bash -e -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets --settings devstack_docker'
done

# Allow LMS SSO for CMS
./provision-ida-user.sh cms cms "$cms_port"

# Provision a retirement service account user
./provision-retirement-user.sh retirement retirement_service_worker

# Add demo program
./programs/provision.sh lms
