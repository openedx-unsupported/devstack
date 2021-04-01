set -e

echo "** Marketing: Restarting **"
docker-compose restart edraak_marketing

echo "** Marketing: Copy cacheed files to code dir **"
docker-compose exec edraak_marketing bash -c 'cp -Rn /cache/* /app/.'
docker-compose exec edraak_marketing bash -c 'pip install -r requirements.txt'

echo "** Marketing: Migrating databases **"
docker-compose exec edraak_marketing bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

echo "** Marketing: Compiling assets **"
docker-compose exec edraak_marketing bash -c 'yarn'
docker-compose exec edraak_marketing bash -c 'npm run dev'

echo "** Marketing: Restarting **"
docker-compose restart edraak_marketing