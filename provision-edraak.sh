set -e

echo "** Bringing up **"
docker-compose $DOCKER_COMPOSE_FILES up -d mysql edraak_programs

echo "** Creating databases **"
docker exec -i b2b.devstack.mysql mysql -uroot mysql < provision-edraak.sql

echo "** Programs **"
./provision-edraak-programs.sh
