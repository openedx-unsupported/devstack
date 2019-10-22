set -e

echo "** Restarting **"
docker-compose restart edraak_marketing

echo "** Migrating databases **"
docker-compose exec edraak_marketing bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

echo "** Compiling assets **"
docker-compose exec edraak_marketing bash -c 'yarn'
docker-compose exec edraak_marketing bash -c 'npx gulp'

echo "** Restarting **"
docker-compose restart edraak_marketing
