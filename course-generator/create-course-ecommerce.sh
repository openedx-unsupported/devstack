# Script that generates in ecommerce the courses in test-course-ecommerce.json 
SETTINGS=`tr -d '\n' < "course-generator/test-course-ecommerce.json"`
docker exec -t edx.devstack.ecommerce bash -c "source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py generate_courses '$SETTINGS'"
