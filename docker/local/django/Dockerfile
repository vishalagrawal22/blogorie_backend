ARG PYTHON_MAJOR_VERSION=3
ARG PYTHON_MINOR_VERSION=11
ARG PYTHON_PATCH_VERSION=5
ARG PYTHON_VERSION=${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}.${PYTHON_PATCH_VERSION}-bullseye

FROM python:${PYTHON_VERSION} as python

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PIP_NO_CACHE_DIR 0

FROM python as python-build-stage

RUN apt-get update && apt install --no-install-recommends -y \
    build-essential \
    libpq-dev

RUN pip install pipenv

COPY Pipfile .
COPY Pipfile.lock .
RUN pipenv install --dev --deploy --system

FROM python as python-run-stage

ARG PYTHON_MAJOR_VERSION
ARG PYTHON_MINOR_VERSION
ARG APP_HOME=/app

WORKDIR ${APP_HOME}

RUN apt-get update && apt install --no-install-recommends -y \
    libpq-dev \
    gettext \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

COPY --from=python-build-stage /usr/local/lib/python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}/site-packages \
    /usr/local/lib/python${PYTHON_MAJOR_VERSION}.${PYTHON_MINOR_VERSION}/site-packages

COPY --from=python-build-stage /usr/local/bin /usr/local/bin

COPY ./docker/local/django/entrypoint /entrypoint

RUN sed -i 's/\r$//' /entrypoint
RUN chmod +x /entrypoint

COPY ./docker/local/django/start /start

RUN sed -i 's/\r$//' /start
RUN chmod +x /start

COPY . ${APP_HOME}

ENTRYPOINT [ "/entrypoint" ]
