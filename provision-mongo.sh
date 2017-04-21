docker-compose up -d mongo
docker exec -i edx.devstack.mongo mongo < mongo-provision.js
docker-compose stop mongo

