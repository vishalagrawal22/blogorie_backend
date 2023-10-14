build:
	docker compose -f local.yaml up --build -d --remove-orphans

up:
	docker compose -f local.yaml up -d

down:
	docker compose -f local.yaml down

logs:
	docker compose -f local.yaml logs

logs-django-backend:
	docker compose -f local.yaml logs django-backend

make-migrations:
	docker compose -f local.yaml run --rm django-backend python manage.py makemigrations

migrate:
	docker compose -f local.yaml run --rm django-backend python manage.py migrate

collectstatic:
	docker compose -f local.yaml run --rm django-backend python manage.py collectstatic --no-input --clear

createsuperuser:
	docker compose -f local.yaml run --rm django-backend python manage.py createsuperuser

down-v:
	docker compose -f local.yaml down -v

inspect-postgres-volume:
	docker volume inspect blogorie_backend_local_postgres_data

blogorie-db:
	docker compose -f local.yaml exec postgres psql -U blogorie-server -d blogorie-db

flake8:
	docker compose -f local.yaml exec django-backend flake8 .

black-check:
	docker compose -f local.yaml exec django-backend black --check --exclude migrations .

black-diff:
	docker compose -f local.yaml exec django-backend black --diff --exclude migrations .

black:
	docker compose -f local.yaml exec django-backend black --exclude migrations .

isort-check:
	docker compose -f local.yaml exec django-backend isort --check-only --skip migrations .

isort-diff:
	docker compose -f local.yaml exec django-backend isort --diff --skip migrations .

isort:
	docker compose -f local.yaml exec django-backend isort --skip migrations .
