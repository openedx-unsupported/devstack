SETTINGS=`tr -d '\n' < "test-course-studio.json"`
docker-compose exec lms bash -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py cms --settings=devstack_docker generate_test_course '$SETTINGS'"
