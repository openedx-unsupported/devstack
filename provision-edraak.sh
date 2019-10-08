set -e

echo "** Bringing up **"
docker-compose $DOCKER_COMPOSE_FILES up -d mysql edraak_programs edraak_marketing

echo "** Creating databases **"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision-edraak.sql

echo "** Restarting **"
docker-compose restart edraak_programs
docker-compose restart edraak_marketing

echo "** Migrating databases **"
docker-compose exec edraak_programs bash -c 'python manage.py migrate --settings=edraakprograms.dev'
docker-compose exec edraak_marketing bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

echo "** Compiling assets **"
docker-compose exec edraak_programs bash -c 'cp -Rnv /cache/node_modules /cache/.compiled /app'
docker-compose exec edraak_programs bash -c 'npm rebuild node-sass'
docker-compose exec edraak_programs bash -c 'gulp'
docker-compose exec edraak_programs bash -c 'python manage.py compilestatic --settings=edraakprograms.static'
docker-compose exec edraak_programs bash -c 'python manage.py collectstatic --ignore="*.less" --ignore="*.scss" --noinput --clear --settings=edraakprograms.dev'
docker-compose exec edraak_marketing bash -c 'yarn'
docker-compose exec edraak_marketing bash -c 'npx gulp'

echo "** Restarting **"
docker-compose restart edraak_programs
docker-compose restart edraak_marketing
