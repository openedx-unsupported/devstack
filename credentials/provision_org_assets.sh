#!/usr/bin/env bash
echo 'Adding assets to the edX demo organization'
docker-compose exec -T discovery bash -c 'mkdir /edx/app/discovery/discovery/provision-temp'
docker cp ./assets edx.devstack.discovery:/edx/app/discovery/discovery/provision-temp/assets
docker-compose exec -T discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py add_logos_to_organization --partner=edX --logo=/edx/app/discovery/discovery/provision-temp/assets/demo-asset-logo.png --certificate_logo=/edx/app/discovery/discovery/provision-temp/assets/demo-asset-certificate-logo.png --banner_image=/edx/app/discovery/discovery/provision-temp/assets/demo-asset-banner-image.png'
echo 'Successful... Cleaning up.'
docker-compose exec -T discovery bash -c 'rm -rf /edx/app/discovery/discovery/provision-temp'
