set -x

service=$1

if [[ $service == "registrar" ]]; then
    curl http://localhost:18734/heartbeat
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
    echo
fi
if [[ $service == "lms" ]]; then
    echo "Checking LMS heartbeat:"
    curl http://localhost:18000/heartbeat
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
    echo
    echo "Checking Studio heartbeat:"
    curl http://localhost:18010/heartbeat # Studio
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
    echo
fi
if [[ $service == "ecommerce" ]]; then
    echo "Checking ecommerce health:"
    curl http://localhost:18130/health/ # Ecommerce
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
    echo
fi
if [[ $service == "discovery" ]]; then
    echo "Checking discovery health:"
    curl http://localhost:18381/health/ # Discovery
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
    echo
fi
if [[ $service == "forum" ]]; then
    echo "Checking forum health:"
    curl http://localhost:44567/heartbeat # Forums
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
fi

if [[ $service == "notes" ]]; then
    echo "Checking notes health:"
    curl http://localhost:18120/heartbeat # Forums
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
fi

if [[ $service == "credentials" ]]; then
    echo "Checking credentials health:"
    curl http://localhost:18150/heartbeat # Forums
    if [ $? -ne 0 ]; then
        docker-compose logs
        exit 2
    fi
fi

