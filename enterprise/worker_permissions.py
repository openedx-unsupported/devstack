#!/usr/bin/env python
# Run like so:
# ./manage.py lms shell -c "`cat worker_permissions.py`"

from django.contrib.auth import get_user_model
from django.contrib.auth.models import Permission


User = get_user_model()
enterprise_worker = User.objects.get(username='enterprise_worker')

enterprise_model_permissions = list(Permission.objects.filter(content_type__app_label='enterprise'))

enterprise_worker.user_permissions.add(*enterprise_model_permissions)
enterprise_worker.save()
