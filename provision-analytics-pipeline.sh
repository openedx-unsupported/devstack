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

# Bring the mysql & pipeline containers online.
docker-compose $DOCKER_COMPOSE_FILES up -d mysql analyticspipeline

# Ensure the MySQL server is online and usable
echo "Waiting for MySQL"
until docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')" &> /dev/null
do
  printf "."
  sleep 1
done

# Analytics pipeline has dependency on lms so we ensure that it is only provisioned once by checking for lms db existence
if [[ ! -z "`docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='edxapp'" 2>&1`" ]];
then
  echo -e "${GREEN}LMS DB exists, no need to provision it${NC}"
else
  echo -e "${GREEN}LMS DB not found, reprovisioning LMS${NC}"
  docker-compose up -d mongo
  docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql
  docker exec -i edx.devstack.mongo mongo < mongo-provision.js

  ./provision-lms.sh
fi

echo -e "${GREEN}Creating databases and users...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision-analytics-pipeline.sql

# initialize hive metastore
echo -e "${GREEN}Initializing HIVE metastore...${NC}"
docker-compose $DOCKER_COMPOSE_FILES exec analyticspipeline bash -c '/edx/app/hadoop/hive/bin/schematool -dbType mysql -initSchema'

# materialize hadoop directory structure
echo -e "${GREEN}Initializing Hadoop directory structure...${NC}"

until curl http://namenode:50070/jmx?qry=Hadoop:service=NameNode,name=NameNodeStatus|grep -q 'active'; do
  printf "Waiting for namenode!"
  sleep 5
done

sleep 10 # for datanode & other services to activate
echo -e "${GREEN}Namenode is ready!${NC}"

docker-compose $DOCKER_COMPOSE_FILES exec -u hadoop analyticspipeline bash -c 'sudo /edx/app/hadoop/hadoop/bin/hdfs dfs -chown -R hadoop:hadoop hdfs://namenode:8020/; hdfs dfs -mkdir -p hdfs://namenode:8020/edx-analytics-pipeline/{warehouse,marker,manifest,packages} hdfs://namenode:8020/{spark-warehouse,data} hdfs://namenode:8020/tmp/spark-events;hdfs dfs -copyFromLocal -f /edx/app/hadoop/lib/edx-analytics-hadoop-util.jar hdfs://namenode:8020/edx-analytics-pipeline/packages/;'

docker image prune -f

echo -e "${GREEN}Analytics pipeline provisioning complete!${NC}"
