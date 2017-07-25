# Script that generates in studio the courses in test-course-studio.json 
SETTINGS=`tr -d '\n' < "course-generator/test-course-studio.json"`
docker-compose exec lms bash -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py cms --settings=devstack_docker generate_test_course '$SETTINGS'"
