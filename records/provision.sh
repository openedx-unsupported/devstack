#!/bin/sh

BASEDIR=$(dirname "$0")

# Main items are green, rest is dull grey since they are noisy, but we still might want to see their output,
# for error cases and the like.
notice() {
    SWITCH="\033["
    GREY="${SWITCH}0;37m"
    GREEN="${SWITCH}0;32m"
    echo "${GREEN}${@}${GREY}"
}

# We reset color once we're done with the script.
# If we wanted to be really fancy, we'd trap signals and reset there too.
reset_color() {
    SWITCH="\033["
    NORMAL="${SWITCH}0m"
    echo "${NORMAL}"
}

docker_exec() {
    service=${1}
    cmd=${2}

    app=${service}
    repo=${service}
    if [ "$service" = "lms" ]; then
        app="edxapp"
        repo="edx-platform"
    fi

    docker-compose exec "$service" bash -c "
        source /edx/app/$app/${app}_env &&
        yes | /edx/app/$app/$repo/manage.py $cmd
    "

    reset_color
}

docker_exec_file() {
    file=${1}

    service=$(echo "$file" | sed -E 's/^([^.]*).*/\1/g')
    cmd="shell"
    if [ "$service" = "lms" ]; then
        cmd="lms shell"
    elif [ "$service" = "cms" ]; then
        service="lms"
        cmd="cms shell"
    fi

    # Escape double quotes and backticks from the Python
    PROGRAM_SCRIPT="$(sed -E 's/("|`)/\\\1/g' < "$BASEDIR/$file")"

    docker_exec "$service" "$cmd -c \"$PROGRAM_SCRIPT\""
}


notice Users...
for user in records records_one_no_cert records_one_excluded_cert records_one_cert records_unverified; do
    docker_exec lms "lms manage_user $user $user@example.com --initial-password-hash=pbkdf2_sha256\\\$20000\\\$TjE34FJjc3vv\\\$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=" | grep "Created new user"
done

notice Organizations...
docker_exec_file discovery.orgs.py

notice Courses...
if [ "$1" = "clean" ]; then
    COURSES=$(grep organization -A2 "$BASEDIR/courses.json" | cut -d\" -f4 | tr '\n' + | sed -E 's/\+--\+/\n/g;s/\+$//g')
    for course in $COURSES; do
        docker_exec lms "cms delete_course 'course-v1:$course'"
    done
fi
"$BASEDIR/../course-generator/create-courses.sh" --studio --ecommerce "$BASEDIR/courses.json"

notice Programs...
docker_exec discovery refresh_course_metadata
docker_exec_file discovery.py

# Enroll users
docker_exec lms "lms enroll_user_in_course -e records_one_no_cert@example.com -c course-v1:edX+RecordsSelfPaced+1"
docker_exec lms "lms change_enrollment -u records_one_no_cert -c course-v1:edX+RecordsSelfPaced+1 -f audit -t verified"

docker_exec lms "lms enroll_user_in_course -e records_one_cert@example.com -c course-v1:edX+RecordsSelfPaced+1"
docker_exec lms "lms change_enrollment -u records_one_cert -c course-v1:edX+RecordsSelfPaced+1 -f audit -t verified"

docker_exec lms "lms enroll_user_in_course -e records_unverified@example.com -c course-v1:edX+RecordsSelfPaced+1"
docker_exec lms "lms change_enrollment -u records_unverified -c course-v1:edX+RecordsSelfPaced+1 -f audit -t verified"

docker_exec lms "lms enroll_user_in_course -e records_one_excluded_cert@example.com -c course-v1:edX+RecordsExcludedCert+1"
docker_exec lms "lms change_enrollment -u records_one_excluded_cert -c course-v1:edX+RecordsExcludedCert+1 -f audit -t verified"

for course in TESTx+RecordsNewSchool+1 edX+RecordsSelfPaced+1 edX+RecordsGradeChanged+1 edX+RecordsLongName+1 \
              edX+RecordsWhitelisted+1 edX+RecordsRevoked+1 edX+RecordsAwarded+1 edX+RecordsExcludedCert+1 \
              edX+RecordsExcludedCert+2 edX+RecordsNotGraded+1 edX+RecordsAllExcluded+1 edX+RecordsNoneActive+1 \
              edX+RecordsMultiTitled+1 edX+RecordsMultiTitled+2 edX+RecordsMultiGraded+1 edX+RecordsMultiGraded+2 \
              edX+RecordsThirdAttempt+1 edX+RecordsThirdAttempt+2 edX+RecordsThirdAttempt+3 edX+RecordsRevokeAward+1 \
              edX+RecordsRevokeAward+2; do
    docker_exec lms "lms enroll_user_in_course -e records@example.com -c course-v1:$course"
    docker_exec lms "lms change_enrollment -u records -c course-v1:$course -f audit -t verified"
done

notice Certificates...
docker_exec_file lms.py

"$BASEDIR/../programs/provision.sh" cache

reset_color

exit 0
