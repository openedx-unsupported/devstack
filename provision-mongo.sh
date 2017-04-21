docker-compose up -d mongo
sleep 20
docker exec -i edx.devstack.mongo mongo < mongo-provision.js
docker-compose stop mongo

