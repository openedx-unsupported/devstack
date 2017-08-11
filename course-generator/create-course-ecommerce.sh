# Script that generates in ecommerce the courses
if [ "$#" -ne 1 ]; then
    echo "Must supply the course config file. E.g. create-course-ecommerce.sh test-course.json"
else
	SETTINGS=`tr -d '\n' < "$1"`
	docker exec -t edx.devstack.ecommerce bash -c "source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py generate_courses '$SETTINGS'"
fi
