#!/usr/bin/env python3
# Run like so:
# ./manage.py shell -c "`cat discovery.py`"

import urllib.request as request
from course_discovery.apps.core.models import Partner
from course_discovery.apps.course_metadata.models import (
    Course, CourseRun, Organization, Program, ProgramType, SeatType
)

DEMO_IMAGE_URL = 'http://b2b.devstack.lms:18000/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg'


# Make sure micromasters type exists
micromasters, _ = ProgramType.objects.get_or_create(slug='micromasters', defaults={'name': 'MicroMasters'})
micromasters.applicable_seat_types.add(
    SeatType.objects.get_or_create(slug='verified', defaults={'name': 'Verified'})[0],
    SeatType.objects.get_or_create(slug='professional', defaults={'name': 'Professional'})[0],
    SeatType.objects.get_or_create(slug='credit', defaults={'name': 'Credit'})[0],
)

# Add a demo program
edx_partner = Partner.objects.get(short_code='edx')  # created during normal provision
program, _ = Program.objects.update_or_create(
    marketing_slug='demo-program',
    defaults={
        'title': 'edX Demonstration Program',
        'type': micromasters,
        'status': 'active',
        'partner': edx_partner,
        'overview': 'A demo program for testing.',
        'total_hours_of_effort': 4,
        'min_hours_effort_per_week': 1,
        'max_hours_effort_per_week': 4,
        'one_click_purchase_enabled': True,
        'card_image_url': DEMO_IMAGE_URL,
    },
)

# Now, after an ID has been created, connect the program to other models

course = Course.objects.get(key='edX+DemoX')
program.courses = [course]

try:
    # This run causes run-time exceptions, because it uses old style key.
    deprecated_run = CourseRun.objects.get(key='edX/DemoX/Demo_Course')
    program.excluded_course_runs = [deprecated_run]
except CourseRun.DoesNotExist:
    # This key only seems to be in some existing devstacks, don't worry if it doesn't exist
    pass

edx_org = Organization.objects.get(key='edX')
program.authoring_organizations = [edx_org]
program.credit_backing_organizations = [edx_org]

# And set up the banner image
if not program.banner_image.name:
    program.banner_image.save('banner.jpg', request.urlopen(DEMO_IMAGE_URL))

program.save()
