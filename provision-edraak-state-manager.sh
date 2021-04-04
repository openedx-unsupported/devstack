set -e

echo "** state-manager-api: Restarting **"
docker-compose $DOCKER_COMPOSE_FILES restart state-manager-mysql

echo "Waiting for state-manager-mysql"
until docker exec -i state-manager-mysql mysql -uroot -se "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')" &> /dev/null
do
  printf "."
  sleep 1
done
# In the event of a fresh MySQL container, wait a few seconds for the server to restart
# This can be removed once https://github.com/docker-library/mysql/issues/245 is resolved.
sleep 10

echo "** state-manager-api: Create/Upgrade DB **"
docker-compose exec state-manager-api bash -c 'flask create-db'
docker-compose exec state-manager-api bash -c 'flask db upgrade'


echo "** state-manager-api: Restarting **"
docker-compose restart state-manager-api
