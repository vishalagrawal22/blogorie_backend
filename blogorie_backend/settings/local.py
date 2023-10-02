from .base import *  # noqa
from .base import env

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env(
    "DJANGO_SECRET_KEY", default="_twNyR2hr6OfF4Zm2LfmG58luk45VIUlufbBDFkDXwpVDEa9UgI"
)

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

CORS_TRUSTED_ORIGINS = ["http://localhost:8080"]
