# Script that generates in ecommerce the courses in test-course-ecommerce.json 
if [ "$#" -ne 1 ]; then
    echo "Must supply the course config file. E.g. create-course-studio.sh test-course.json"
fi
SETTINGS=`tr -d '\n' < "$1"`
docker exec -t edx.devstack.ecommerce bash -c "source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py generate_courses '$SETTINGS'"
