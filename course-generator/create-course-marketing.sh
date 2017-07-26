# Script that generates in marketing the courses
if [ "$#" -ne 1 ]; then
    echo "Must supply the course config file. E.g. create-course-marketing.sh test-course.json"
else
	SETTINGS=`tr -d '\n' < "$1"`
	docker exec -t edx.devstack.marketing bash -c "drush generate_courses '$SETTINGS'"
fi
