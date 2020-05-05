# Load database dumps for the largest databases to save time
./load-db.sh ecommerce

./provision-ida.sh ecommerce ecommerce 18130

# Configure ecommerce
docker-compose exec ecommerce bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py create_or_update_site --site-id=1 --site-domain=localhost:18130 --partner-code=edX --partner-name="Open edX" --lms-url-root=http://edx.devstack.lms:18000 --lms-public-url-root=http://localhost:18000 --client-side-payment-processor=cybersource --payment-processors=cybersource,paypal --sso-client-id=ecommerce-sso-key --sso-client-secret=ecommerce-sso-secret --backend-service-client-id=ecommerce-backend-service-key --backend-service-client-secret=ecommerce-backend-service-secret --from-email staff@example.com --discovery_api_url=http://edx.devstack.discovery:18381/api/v1/'
docker-compose exec ecommerce bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py oscar_populate_countries --initial-only'
docker-compose exec ecommerce bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py create_demo_data --partner=edX'
