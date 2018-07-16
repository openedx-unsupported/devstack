#!/usr/bin/env python3
# This file assumes programs are already set up and imported into credentials

from credentials.apps.catalog.models import Program
from credentials.apps.credentials.models import ProgramCertificate


for program in Program.objects.all():
    # Add a default dummy certificate for each program
    ProgramCertificate.objects.update_or_create(
        program_uuid=program.uuid,
        defaults={
            'site': program.site,
            'is_active': True,
        },
    )
