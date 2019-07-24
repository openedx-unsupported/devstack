set -e
set -o pipefail
set -x

apps=( lms studio )

# Load database dumps for the largest databases to save time
./load-db.sh edxapp
./load-db.sh edxapp_csmh

# Appsembler: Optimize provision time
docker exec -i edx.devstack.mysql mysql -uroot edxapp < edxapp_appsembler.sql

# Bring edxapp containers online
for app in "${apps[@]}"; do
    docker-compose $DOCKER_COMPOSE_FILES up -d $app
done

docker-compose exec lms bash -e -c 'source /edx/app/edxapp/edxapp_env;
cd /edx/app/edxapp/edx-platform;

pip install --no-deps -e .
pip install --no-deps -e common/lib/calc
pip install --no-deps -e common/lib/capa
pip install --no-deps -e common/lib/chem
pip install --no-deps -e common/lib/dogstats
pip install --no-deps -e common/lib/safe_lxml
pip install --no-deps -e common/lib/sandbox-packages
pip install --no-deps -e common/lib/symmath
pip install --no-deps -e common/lib/xmodule

pip install --no-deps -e openedx/core/lib/xblock_builtin/xblock_discussion

npm install'


#Installing prereqs crashes the process
docker-compose restart lms

# Run edxapp migrations first since they are needed for the service users and OAuth clients
docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 paver update_db --settings devstack_docker'

# Fix missing vendor file by clearing the cache
docker-compose exec lms bash -c 'rm -f /edx/app/edxapp/edx-platform/.prereqs_cache/Node_prereqs.sha1';

# Create static assets for both LMS and Studio
for app in "${apps[@]}"; do
    docker-compose exec $app bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 paver update_assets --settings devstack_docker'
done
