set -e

echo "** Marketing: Restarting **"
docker-compose restart edraak_marketing

echo "** Marketing: Copy cacheed files to code dir **"
docker-compose exec edraak_marketing bash -c 'cp -Rn /cache/* /app/.'

echo "** Marketing: Migrating databases **"
docker-compose exec edraak_marketing bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

echo "** Marketing: Compiling assets **"
docker-compose exec edraak_marketing bash -c 'yarn'
docker-compose exec edraak_marketing bash -c 'npx gulp'

echo "** Marketing: Restarting **"
docker-compose restart edraak_marketing
