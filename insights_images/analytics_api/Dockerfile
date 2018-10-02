# To build this Dockerfile:
#
# From the root of configuration:
#
# docker build -f docker/build/analytics_api/Dockerfile .
#
# This allows the dockerfile to update /edx/app/edx_ansible/edx_ansible
# with the currently checked-out configuration repo.

ARG BASE_IMAGE_TAG=latest
FROM edxops/xenial-common:${BASE_IMAGE_TAG}
MAINTAINER edxops

RUN apt-get update

ADD . /edx/app/edx_ansible/edx_ansible
COPY insights_images/analytics_api/ansible_overrides.yml /
WORKDIR /edx/app/edx_ansible/edx_ansible/docker/plays

COPY insights_images/analytics_api/ansible_overrides.yml /

ARG OPENEDX_RELEASE=master
ARG ANALYTICS_API_LMS_BASE_URL
ARG ANALYTICS_API_DEFAULT_HOST
ARG ANALYTICS_API_REPORTS_HOST


ENV OPENEDX_RELEASE=${OPENEDX_RELEASE}
ENV ANALYTICS_API_LMS_BASE_URL=${ANALYTICS_API_LMS_BASE_URL}
ENV ANALYTICS_API_DEFAULT_HOST=${ANALYTICS_API_DEFAULT_HOST}
ENV ANALYTICS_API_REPORTS_HOST=${ANALYTICS_API_REPORTS_HOST}

RUN /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook analytics_api.yml \
    -i '127.0.0.1,' \
    -c local \
    -t "install:base,install:system-requirements,install:configuration,install:app-requirements,install:code" \
    --extra-vars="ANALYTICS_API_VERSION=${OPENEDX_RELEASE}" \
    --extra-vars="ANALYTICS_API_LMS_BASE_URL=${ANALYTICS_API_LMS_BASE_URL}" \
    --extra-vars="ANALYTICS_API_DEFAULT_HOST=${ANALYTICS_API_DEFAULT_HOST}" \
    --extra-vars="ANALYTICS_API_REPORTS_HOST=${ANALYTICS_API_REPORTS_HOST}" \
    --extra-vars="ANALYTICS_API_AUTH_TOKEN='analytics_api-secret'" \
    --extra-vars="ANALYTICS_API_SECRET_KEY='analytics_api-key'" \
    --extra-vars="ANALYTICS_API_DJANGO_SETTINGS_MODULE='analyticsdataserver.settings.local'" \
    --extra-vars="@/ansible_overrides.yml"
WORKDIR /edx/app/
CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "-n", "--configuration", "/edx/app/supervisor/supervisord.conf"]
EXPOSE 8180 18180
