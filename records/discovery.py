#!/usr/bin/env python3
# This file assumes programs are already set up


def make_program(slug, title, courses=None, excluded=None, status='active'):
    import urllib.request as request
    from course_discovery.apps.core.models import Partner
    from course_discovery.apps.course_metadata.models import (
        Course, CourseRun, Organization, Program, ProgramType, SeatType
    )

    DEMO_IMAGE_URL = 'http://edx.devstack.lms:18000/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg'

    micromasters = ProgramType.objects.get(slug='micromasters')
    edx_partner = Partner.objects.get(short_code='edx')
    program, created = Program.objects.update_or_create(
        marketing_slug='records-' + slug,
        defaults={
            'title': title,
            'type': micromasters,
            'status': status,
            'partner': edx_partner,
            'total_hours_of_effort': 4,
            'min_hours_effort_per_week': 1,
            'max_hours_effort_per_week': 4,
            'one_click_purchase_enabled': True,
            'card_image_url': DEMO_IMAGE_URL,
        },
    )

    # Now, after an ID has been created, connect the program to other models
    course_objs = [Course.objects.get(key=x) for x in courses or []]
    excluded_objs = [CourseRun.objects.get(key=x) for x in excluded or []]
    edx_org = Organization.objects.get(key='edX')
    program.courses = course_objs
    program.excluded_course_runs = excluded_objs
    program.authoring_organizations = [edx_org]
    program.credit_backing_organizations = [edx_org]

    # And set up the banner image
    if not program.banner_image.name:
        program.banner_image.save('banner.jpg', request.urlopen(DEMO_IMAGE_URL))

    program.save()


# All non-active program statuses
make_program('unpublished', 'Unpublished Program', status='unpublished', courses=[
    'edX+RecordsSelfPaced', 'edX+RecordsGradeChanged',
])
make_program('retired', 'Retired Program', status='retired', courses=[
    'edX+RecordsSelfPaced', 'edX+RecordsGradeChanged',
])
make_program('deleted', 'Deleted Program', status='deleted', courses=[
    'edX+RecordsSelfPaced', 'edX+RecordsGradeChanged',
])

# Some cert states
make_program('long-name', 'Really Great Program With An Equally Long Name To Show How Amazing It Is: If You Don\'t Sign Up For This, The Only Certificate You Deserve Is For Being A Fool', courses=[
    'edX+RecordsSelfPaced', 'edX+RecordsGradeChanged',
])
make_program('two-schools', 'Two-School Program', courses=[
    'edX+RecordsSelfPaced', 'TESTx+RecordsNewSchool',
])
make_program('one-course', 'One-Course Program', courses=[
    'edX+RecordsSelfPaced',
])

# Everything else
make_program('kitchen-sink', 'Everything', courses=[
    'TESTx+RecordsNewSchool',
    'edX+RecordsSelfPaced',
    'edX+RecordsGradeChanged',
    'edX+RecordsLongName',
    'edX+RecordsWhitelisted',
    'edX+RecordsRevoked',
    'edX+RecordsAwarded',
    'edX+RecordsExcludedCert',
    'edX+RecordsNotGraded',
    'edX+RecordsAllExcluded',
    'edX+RecordsNoneActive',
    'edX+RecordsMultiTitled',
    'edX+RecordsMultiGraded',
    'edX+RecordsThirdAttempt',
    'edX+RecordsRevokeAward',
], excluded=[
    'course-v1:edX+RecordsExcludedCert+1',
    'course-v1:edX+RecordsAllExcluded+1',
])
