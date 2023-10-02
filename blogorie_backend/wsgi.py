"""
WSGI config for blogorie_backend project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

# TODO change in production
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "blogorie_backend.settings.local")

application = get_wsgi_application()
