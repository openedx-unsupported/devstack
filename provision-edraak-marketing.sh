set -e

echo "** Marketing: Restarting **"
docker-compose restart mktg

echo "** Marketing: Copy cacheed files to code dir **"
docker-compose exec mktg bash -c 'cp -Rn /cache/* /app/.'
docker-compose exec mktg bash -c 'pip install -r requirements.txt'

echo "** Marketing: Migrating databases **"
docker-compose exec mktg bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

echo "** Marketing: Compiling assets **"
docker-compose exec mktg bash -c 'yarn'
docker-compose exec mktg bash -c 'npm run dev'

echo "** Marketing: Restarting **"
docker-compose restart mktg
