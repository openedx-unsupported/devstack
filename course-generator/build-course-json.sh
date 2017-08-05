# Script to build course configurations in proper json format that can be passed into provision-courses.sh
# See test-course.json for a master list of course configurations
# TODO: Link documentation for course-generator-tool
# USAGE: ./build-course-json.sh [course-config-file]

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit
fi
config_file="$1"
write_to_config() {
    # Write (json) content to the config file
    echo "$@" > $config_file
}

wrap_json() {
    # Wrap the content in curly braces '{}'
    echo "{"
    echo "$@"
    echo "}"
}

build_course_base() {
    # Print the (key-value pairs) base requirements of the course json.
    # $1 = organization
    # $2 = number (setting this to null acts as a proxy for random during course provisioning)
    # $3 = run
    # $4 = user
    # $5 = partner
    #
    # Output: '"organization":..., "number":...,'

    base_values=("$@")
    base_keys=(
        "organization" 
        "number" 
        "run" 
        "user" 
        "partner"
    )
    
    last=`expr ${#base_keys[@]} - 1`
    for ((i=0;i<${#base_keys[@]};++i)); do
        echo "\"${base_keys[i]}\": ${base_values[i]}"
        if [ $i -ne $last ]; then
            echo ","
        fi
    done
}

build_course_fields() {
    # Print the (key-value pairs) fields (studio settings) of the course json
    # $1 = "display_name"
    #
    # Output: '"display_name":...,'

    fields_values=("$@")
    fields_keys=(
        "display_name"
        "mobile_available"
    )

    last=`expr ${#fields_keys[@]} - 1`
    for ((i=0;i<${#fields_keys[@]};++i)); do
        echo "\"${fields_keys[i]}\": ${fields_values[i]}"
        if [ $i -ne $last ]; then
            echo ","
        fi
    done
}

build_course_enrollment() {
    # Print the (key-value pairs) enrollment data of the course json
    # $1 = audit
    # $2 = honor
    # $3 = verified
    # $4 = professional_education
    # $5 = no_id_verification
    # $6 = credit
    # $7 = credit_provider
    #
    # Output:'"audit":..., "honor":...,'

    enrollment_values=("$@")
    enrollment_keys=(
        "audit" 
        "honor"
        "verified"
        "professional_education" 
        "no_id_verification" 
        "credit" 
        "credit_provider"
    )

    last=`expr ${#enrollment_keys[@]} - 1`
    for ((i=0;i<${#enrollment_keys[@]};++i)); do
        echo "\"${enrollment_keys[i]}\": ${enrollment_values[i]}"
        if [ $i -ne $last ]; then
            echo ","
        fi
    done
}

#################################################
### DEFINE COURSE BUILDER FUNCTIONS HERE ###
#################################################
# Output should be a course json object
build_course_mode() {
    # Builds properly formatted, wrapped json for single course with configurable enrollment settings
    # $1 = display_name
    # $2 = audit
    # $3 = honor
    # $4 = verified
    # $5 = professional_education
    # $6 = no_id_verification
    # $7 = credit
    # $8 = credit_provider
    #
    # Output: '{...course-settings...}'
    
    wrap_json $(
        # 1. Base settings
        build_course_base "\"test-course-generator\"" null "\"1\"" "\"edx@example.com\"" "\"edx\""
        echo ","

        # 2. Fields settings ("fields" key is at the same level as base settings)
        echo "\"fields\":"
        wrap_json $(build_course_fields "$1" true)
        echo ","

        # 3. Enrollment Settings ("enrollment" key is at the same level as base settings)
        echo "\"enrollment\":"
        wrap_json $(build_course_enrollment "$2" "$3" "$4" "$5" "$6" "$7" "$8")
    )
}
#################################################

################################
### DEFINE COURSES HERE ###
################################
# array of courses, where each element is course json object
courses=(
    # Build audit course
    "$(build_course_mode "\"audit course\"" true false false false false false null)"
    # Build honor course
    "$(build_course_mode "\"honor course\"" false true false false false false null)"
    # Build verified course with audit seat
    "$(build_course_mode "\"verified course with audit seat\"" true false true false false false null)"
    # Build verified course with honor seat
    "$(build_course_mode "\"verified course with honor seat\"" false true true false false false null)"
    # Build professional course with required id verification
    "$(build_course_mode "\"professional course id required\"" false false false true false false null)"
    # Build professional course without required id verification
    "$(build_course_mode "\"professional course id not required\"" false false false true true false null)"
    # Build credit course with audit seat
    "$(build_course_mode "\"credit course with audit seat\"" true false true false false true "\"test-credit-provider\"")"
    # Build credit course with honor seat
    "$(build_course_mode "\"credit course with honor seat\"" false true true false false true "\"test-credit-provider\"")"
)
################################

# Print courses in proper format
# '{"courses": [...list of course json objects...]}'
courses_json=$(wrap_json $(
    echo "\"courses\":"
    echo "["
    last=`expr ${#courses[@]} - 1`
    for ((i=0;i<${#courses[@]};++i)); do
        echo "${courses[i]}"
        if [ $i -ne $last ]; then
            echo ","
        fi
    done
    echo "]"
))
write_to_config "$courses_json"

# Pretty print json
cat $config_file | python -m json.tool > "tmp.json"
cat "tmp.json" > $config_file
rm "tmp.json"
