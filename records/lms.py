#!/usr/bin/env python

from lms.djangoapps.grades.config.models import PersistentGradesEnabledFlag
from openedx.core.djangoapps.credentials.models import CredentialsApiConfig


def set_current_config(cls, args):
    if not cls.equal_to_current(args):
        config = cls(**args)
        config.save()


def make_cert(username, course, status='downloadable', grade=0.90, letter_grade='B'):
    from django.contrib.auth.models import User
    from opaque_keys.edx.keys import CourseKey
    from lms.djangoapps.certificates.models import GeneratedCertificate
    from lms.djangoapps.grades.models import PersistentCourseGrade

    user = User.objects.get(username=username)
    course_key = CourseKey.from_string(course)
    passed = status != 'notpassing'

    PersistentCourseGrade.update_or_create(user.id, course_key, passed=passed,
                                           letter_grade=letter_grade, percent_grade=grade)

    GeneratedCertificate.eligible_certificates.update_or_create(
        user=user,
        course_id=course_key,
        defaults={
            'mode': 'verified',
            'status': status,
            'grade': grade,
            'download_url': 'http://example.com/' if status == 'downloadable' else '',
            'verify_uuid': 'd7ef9983779e4109bd935ec6fc16fe12',
            'download_uuid': 'd7ef9983779e4109bd935ec6fc16fe12',
        }
    )


def verify(username):
    from django.contrib.auth.models import User
    from lms.djangoapps.verify_student.models import SoftwareSecurePhotoVerification

    user = User.objects.get(username=username)

    SoftwareSecurePhotoVerification.objects.update_or_create(
        user=user,
        defaults={
            'status': 'approved',
        }
    )


set_current_config(PersistentGradesEnabledFlag, {'enabled': True, 'enabled_for_all_courses': True})
set_current_config(CredentialsApiConfig, {
    'internal_service_url': 'http://example.com',
    'public_service_url': 'http://example.com',
    'enable_learner_issuance': True,
    'enabled': True,
})


verify('records_one_cert')
verify('records_one_excluded_cert')
verify('records')


make_cert('records_one_cert', 'course-v1:edX+RecordsSelfPaced+1')
make_cert('records_unverified', 'course-v1:edX+RecordsSelfPaced+1')
make_cert('records_one_excluded_cert', 'course-v1:edX+RecordsExcludedCert+1')

make_cert('records', 'course-v1:edX+RecordsSelfPaced+1')
make_cert('records', 'course-v1:edX+RecordsGradeChanged+1')
make_cert('records', 'course-v1:edX+RecordsWhitelisted+1', grade=0)
make_cert('records', 'course-v1:edX+RecordsRevoked+1', status='invalidated')
make_cert('records', 'course-v1:edX+RecordsAwarded+1')
make_cert('records', 'course-v1:edX+RecordsExcludedCert+1')
make_cert('records', 'course-v1:edX+RecordsNotGraded+1', grade=0)
make_cert('records', 'course-v1:edX+RecordsAllExcluded+1')
make_cert('records', 'course-v1:edX+RecordsMultiTitled+1', grade=0.80)
make_cert('records', 'course-v1:edX+RecordsMultiTitled+2')
make_cert('records', 'course-v1:edX+RecordsMultiGraded+1', grade=0.95, letter_grade='C')
make_cert('records', 'course-v1:edX+RecordsMultiGraded+2', grade=0.85)
make_cert('records', 'course-v1:edX+RecordsThirdAttempt+2', status='notpassing')
make_cert('records', 'course-v1:edX+RecordsThirdAttempt+3')
make_cert('records', 'course-v1:edX+RecordsRevokeAward+1', status='invalidated')
make_cert('records', 'course-v1:edX+RecordsRevokeAward+2')
