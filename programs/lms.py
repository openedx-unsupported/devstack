#!/usr/bin/env python
# Run like so:
# ./manage.py lms shell -c "`cat lms.py`"

from django.contrib.sites.models import Site
from openedx.core.djangoapps.catalog.models import CatalogIntegration
from openedx.core.djangoapps.programs.models import ProgramsApiConfig
from openedx.core.djangoapps.site_configuration.models import SiteConfiguration

DISCOVERY_API_URL = 'http://b2b.devstack.discovery:18381/api/v1/'


def set_current_config(cls, args):
    if not cls.equal_to_current(args):
        config = cls(**args)
        config.save()


# Enable the program dashboard
set_current_config(ProgramsApiConfig, {'enabled': True})

# Enable the discovery worker
set_current_config(CatalogIntegration, {
    'enabled': True,
    'internal_api_url': 'https://example.com/api',  # required but unused
    'service_username': 'discovery_worker',
})

# Tell LMS about discovery
SiteConfiguration.objects.update_or_create(
    site=Site.objects.get(domain='example.com'),
    defaults={
        'enabled': True,
        'values': {'COURSE_CATALOG_API_URL': DISCOVERY_API_URL},
    },
)
