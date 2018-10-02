# To build this Dockerfile:
#
# From the root of configuration:
#
# docker build -f docker/build/insights/Dockerfile .
#
# This allows the dockerfile to update /edx/app/edx_ansible/edx_ansible
# with the currently checked-out configuration repo.

ARG BASE_IMAGE_TAG=latest
FROM edxops/xenial-common:${BASE_IMAGE_TAG}
MAINTAINER edxops

ADD . /edx/app/edx_ansible/edx_ansible
COPY insights_images/insights/ansible_overrides.yml /
WORKDIR /edx/app/edx_ansible/edx_ansible/docker/plays

ARG OPENEDX_RELEASE=master
ARG ANALYTICS_API_ENDPOINT
ARG INSIGHTS_DATA_API_AUTH_TOKEN
ARG INSIGHTS_DATABASE_HOST
ARG INSIGHTS_LMS_BASE
ARG INSIGHTS_CMS_BASE

ENV OPENEDX_RELEASE=${OPENEDX_RELEASE}
ENV ANALYTICS_API_ENDPOINT=${ANALYTICS_API_ENDPOINT}
ENV INSIGHTS_DATA_API_AUTH_TOKEN=${INSIGHTS_DATA_API_AUTH_TOKEN}
ENV INSIGHTS_DATABASE_HOST=${INSIGHTS_DATABASE_HOST}
ENV INSIGHTS_LMS_BASE=${INSIGHTS_LMS_BASE}
ENV INSIGHTS_CMS_BASE=${INSIGHTS_CMS_BASE}

RUN /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook insights.yml \
    -i '127.0.0.1,' -c local \
    -t "install:base,install:system-requirements,install:configuration,install:app-requirements,install:code" \
    --extra-vars="INSIGHTS_VERSION=${OPENEDX_RELEASE}" \
    --extra-vars="ANALYTICS_API_ENDPOINT=${ANALYTICS_API_ENDPOINT}" \
    --extra-vars="INSIGHTS_DATA_API_AUTH_TOKEN=${INSIGHTS_DATA_API_AUTH_TOKEN}" \
    --extra-vars="INSIGHTS_DATABASE_HOST=${INSIGHTS_DATABASE_HOST}" \
    --extra-vars="INSIGHTS_DATABASE_PASSWORD='password'" \
    --extra-vars="INSIGHTS_LMS_BASE=${INSIGHTS_LMS_BASE}" \
    --extra-vars="insights_django_settings='analytics_dashboard.settings.devstack'" \
    --extra-vars="INSIGHTS_CMS_BASE=${INSIGHTS_CMS_BASE}" \
    --extra-vars="INSIGHTS_BASE_URL='http://localhost:18110'" \
    --extra-vars="INSIGHTS_OAUTH2_SECRET='insights-secret'" \
    --extra-vars="INSIGHTS_OAUTH2_KEY='insights-key'" \
    --extra-vars="@/ansible_overrides.yml"
CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "-n", "--configuration", "/edx/app/supervisor/supervisord.conf"]
EXPOSE 8110 18110
