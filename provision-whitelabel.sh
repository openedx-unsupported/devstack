set -e
set -o pipefail

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    DEVSTACK_WORKSPACE=..
elif [ ! -d "$DEVSTACK_WORKSPACE" ]; then
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

# For colored status messages below.
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Path definitions within Docker containers.
app_base_path="/edx/app"
edxapp_base_path="${app_base_path}/edxapp"
discovery_base_path="${app_base_path}/discovery"
ecommerce_base_path="${app_base_path}/ecommerce"

# Whitelabel test defintions.
wl_orgs=(
    "MITxPRO"
    "HarvardMedGlobalAcademy"
    "WhartonOnlineProfessionalEd"
)
wl_admin_user="admin@example.com"
wl_course_title="WL_E2E-Test"
wl_course_num="WL_E2E"
wl_course_run="2018"
wl_modulestore="split"
wl_dns_name="wl-ci"
wl_theme_path="${app_base_path}/edx-themes/edx-platform"

#
# Run the needed Django mgmt commands against each container.
#
echo "${GREEN}Creating sites and themes in LMS...${NC}"
cmd="source ${edxapp_base_path}/edxapp_env && ${edxapp_base_path}/edx-platform/manage.py --settings=lms.envs.devstack_docker create_sites_and_configurations --devstack --dns-name ${wl_dns_name} --theme-path ${wl_theme_path}"
docker-compose exec lms bash -c '$cmd'

echo "${GREEN}Creating courses in Studio...${NC}"
for wl_org in ${wl_orgs[*]}
do
    cmd="source ${edxapp_base_path}/edxapp_env && ${edxapp_base_path}/edx-platform/manage.py --settings=cms.envs.devstack_docker create_course ${wl_modulestore} ${wl_admin_user} ${wl_org} ${wl_course_num} ${wl_course_run} ${wl_org}-${wl_course_title}"
    docker-compose exec studio bash -c '$cmd'
done

echo "${GREEN}Creating sites and partners in discovery...${NC}"
cmd="source ${discovery_base_path}/discovery_env && ${discovery_base_path}/discovery/manage.py --settings=course_discovery.settings.devstack create_sites_and_partners --devstack --dns-name ${wl_dns_name} --theme-path ${wl_theme_path}"
docker-compose exec discovery bash -c '$cmd'

echo "${GREEN}Creating sites and partners in ecommerce...${NC}"
cmd="source ${ecommerce_base_path}/ecommerce_env && ${ecommerce_base_path}/ecommerce/manage.py --settings=ecommerce.settings.devstack create_sites_and_partners --devstack --dns-name ${wl_dns_name} --theme-path ${wl_theme_path}"
docker-compose exec ecommerce bash -c '$cmd'
