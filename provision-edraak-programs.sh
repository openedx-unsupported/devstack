set -e

echo "** Progs: Restarting **"
docker-compose restart edraak_programs

echo "** Progs: Copy cacheed files to code dir **"
docker-compose exec edraak_programs bash -c 'cp -Rn /cache/* /app/.'

echo "** Progs: Migrating databases **"
docker-compose exec edraak_programs bash -c 'python manage.py migrate --settings=edraakprograms.dev'

echo "** Progs: Compiling assets **"
docker-compose exec edraak_programs bash -c 'npm rebuild node-sass'
docker-compose exec edraak_programs bash -c 'npm install'
docker-compose exec edraak_programs bash -c 'bower install'
docker-compose exec edraak_programs bash -c 'gulp'
docker-compose exec edraak_programs bash -c 'python manage.py compilestatic --settings=edraakprograms.static'
docker-compose exec edraak_programs bash -c 'python manage.py collectstatic --ignore="*.less" --ignore="*.scss" --noinput --clear --settings=edraakprograms.dev'

echo "** Progs: Restarting **"
docker-compose restart edraak_programs
