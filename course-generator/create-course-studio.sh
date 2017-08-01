# Script that generates in studio the courses in test-course-studio.json 
if [ "$#" -ne 1 ]; then
    echo "Must supply the course config file. E.g. create-course-studio.sh test-course.json"
fi
SETTINGS=`tr -d '\n' < "$1"`
docker-compose exec lms bash -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py cms --settings=devstack_docker generate_courses '$SETTINGS'"
