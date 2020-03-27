#!/usr/bin/env bash

set -e
set -o pipefail
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    DEVSTACK_WORKSPACE=..
elif [ ! -d "$DEVSTACK_WORKSPACE" ]; then
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

# Bring the pipeline containers online.
docker-compose $DOCKER_COMPOSE_FILES up -d analyticspipeline

# Analytics pipeline has dependency on lms but we only need its db schema & not full lms. So we'll just load their db
# schemas as part of analytics pipeline provisioning. If there is a need of a fully fledged LMS, then provision lms
# by following their documentation.
if [[ ! -z "`docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='edxapp'" 2>&1`" ]];
then
  echo -e "${GREEN}LMS DB exists, skipping lms schema load.${NC}"
else
  echo -e "${GREEN}LMS DB not found, provisioning lms schema.${NC}"
  docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql
  ./load-db.sh edxapp
  docker-compose $DOCKER_COMPOSE_FILES up -d lms studio
  docker-compose exec -T lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PYTHON_UNINSTALL=1 paver install_prereqs'
  #Installing prereqs crashes the process
  docker-compose restart lms
  # Run edxapp migrations first since they are needed for the service users and OAuth clients
  docker-compose exec -T lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_db --settings devstack_docker'
fi

echo -e "${GREEN}LMS database provisioned successfully...${NC}"
echo -e "${GREEN}Creating databases and users...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision-analytics-pipeline.sql

# initialize hive metastore
echo -e "${GREEN}Initializing HIVE metastore...${NC}"
docker-compose $DOCKER_COMPOSE_FILES exec analyticspipeline bash -c '/edx/app/hadoop/hive/bin/schematool -dbType mysql -initSchema'

# materialize hadoop directory structure
echo -e "${GREEN}Initializing Hadoop directory structure...${NC}"

until curl http://127.0.0.1:50070/jmx?qry=Hadoop:service=NameNode,name=NameNodeStatus|grep -q 'active'; do
  printf "Waiting for namenode!"
  sleep 5
done

sleep 10 # for datanode & other services to activate
echo -e "${GREEN}Namenode is ready!${NC}"

docker exec -u hadoop -i edx.devstack.analytics_pipeline bash -c 'sudo /edx/app/hadoop/hadoop/bin/hdfs dfs -chown -R hadoop:hadoop hdfs://namenode:8020/; hdfs dfs -mkdir -p hdfs://namenode:8020/edx-analytics-pipeline/{warehouse,marker,manifest,packages} hdfs://namenode:8020/{spark-warehouse,data} hdfs://namenode:8020/tmp/spark-events;hdfs dfs -copyFromLocal -f /edx/app/hadoop/lib/edx-analytics-hadoop-util.jar hdfs://namenode:8020/edx-analytics-pipeline/packages/;'
