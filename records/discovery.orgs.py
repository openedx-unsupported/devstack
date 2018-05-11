#!/usr/bin/env python

from course_discovery.apps.core.models import Partner
from course_discovery.apps.course_metadata.models import Organization

Organization.objects.update_or_create(
    key='TESTx',
    defaults={
        'name': 'Test University',
        'partner': Partner.objects.get(short_code='edx'),
    },
)
