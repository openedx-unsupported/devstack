set -e
set -o pipefail
set -x

# Bring up XQueue, we don't need the consumer for provisioning
docker-compose $DOCKER_COMPOSE_FILES up -d xqueue

# Update dependencies
docker-compose $DOCKER_COMPOSE_FILES exec xqueue bash -c 'source /edx/app/xqueue/xqueue_env && cd /edx/app/xqueue/xqueue && make requirements'
# Run migrations
docker-compose $DOCKER_COMPOSE_FILES exec xqueue bash -c 'source /edx/app/xqueue/xqueue_env && cd /edx/app/xqueue/xqueue && python manage.py migrate'
# Add users that graders use to fetch data, there's one default user in Ansible which is part of our settings
docker-compose $DOCKER_COMPOSE_FILES exec xqueue bash -c 'source /edx/app/xqueue/xqueue_env && cd /edx/app/xqueue/xqueue && python manage.py update_users' 
