#!/usr/bin/env bash
# Script that provisions studio, and ecommerce with courses
# USAGE: ./create-courses [--studio] [--ecommerce] course-config.json
studio=false
ecommerce=false
echo "Parsing options"
container_error=false
for arg in "$@"; do
    if [ $arg == "--studio" ]; then
        if [ ! "$(docker-compose exec lms bash -c 'echo "Course will be created for studio"; exit $?')" ]; then
            echo "Issue with studio container"
            container_error=true
        else
            studio=true
        fi
    elif [ $arg == "--ecommerce" ]; then
        if [ ! "$(docker-compose exec ecommerce bash -c 'echo "Course will be created for ecommerce"; exit $?')" ]; then
            echo "Issue with ecommerce container"
            container_error=true
        else
            ecommerce=true
        fi
    fi
done

if $container_error; then
    echo "Aborting course creation. Check your containers"
    exit
fi

# Users can specify null course numbers in the course_config json as a proxy for random numbers
## This will allow users to rerun the command multiple times and avoid duplicate course ids
course_config_file="${@: -1}"
if [[ ! -f $course_config_file ]] ; then
    echo "$course_config_file does not exist. Must provide a valid course config file."
    exit
fi
course_json=""
while IFS='' read -r line || [[ -n "$line" ]]; do
    course_json=$course_json${line/"\"number\": null"/"\"number\": \""$RANDOM"\""}
done < "${@: -1}"

if $studio ; then
	echo "Creating courses on studio."
	docker-compose exec lms bash -c "source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py cms --settings=devstack_docker generate_courses '$course_json'"
fi

if $ecommerce ; then
	echo "Creating courses on ecommerce."
	docker-compose exec ecommerce bash -c "source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py generate_courses '$course_json'"
fi
