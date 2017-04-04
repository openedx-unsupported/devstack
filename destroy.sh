set -e

read -p "This will delete all data in your devstack. Would you like to proceed? [y/n] " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    docker-compose down
    docker system prune --force
fi
