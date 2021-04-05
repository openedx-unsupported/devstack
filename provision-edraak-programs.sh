set -e

echo "** Progs: Restarting **"
docker-compose `echo $DOCKER_COMPOSE_FILES` restart progs

echo "** Progs: Copy cacheed files to code dir **"
#docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'cp -Rn /cache/* /app/.'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'pip install -r requirements.txt'

echo "** Progs: Migrating databases **"
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'python manage.py migrate --settings=edraakprograms.dev'

echo "** Progs: Compiling assets **"
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'npm rebuild node-sass'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'chown -R root ~/.npm'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'npm install'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'bower install'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'npm run dev'
docker-compose `echo $DOCKER_COMPOSE_FILES` exec progs bash -c 'python manage.py collectstatic --ignore="*.less" --ignore="*.scss" --noinput --clear --settings=edraakprograms.dev'

echo "** Progs: Restarting **"
docker-compose `echo $DOCKER_COMPOSE_FILES` restart progs
