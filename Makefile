DC = docker compose
STORAGES_FILE = docker_compose/storages.yaml
APP_FILE = docker_compose/app.yaml
MONITORING_FILE = docker_compose/monitoring.yaml
EXEC = docker exec -it
DB_CONTAINER = example-db
APP_CONTAINER = main-app
LOGS = docker logs
ENV = --env-file .env
MANAGE_PY = python manage.py


# storages
.PHONY: storages storages-down storages-logs postgres-psql
storages:
	${DC} -f ${STORAGES_FILE} ${ENV} up -d

storages-down:
	${DC} -f ${STORAGES_FILE} down

storages-logs:
	${LOGS} ${DB_CONTAINER} -f

postgres-psql:
	${EXEC} ${DB_CONTAINER} psql


# migrations
.PHONY: migrate migrations
migrate:
	${EXEC} ${APP_CONTAINER} ${MANAGE_PY} migrate

migrations:
	${EXEC} ${APP_CONTAINER} ${MANAGE_PY} makemigrations


# app
.PHONY: app app-logs app-down superuser collectstatic
app:
	${DC} -f ${STORAGES_FILE} -f ${APP_FILE} ${ENV} up --build -d

app-logs:
	${LOGS} ${APP_CONTAINER} -f

app-down:
	${DC} -f ${STORAGES_FILE} -f ${APP_FILE} ${ENV} down

superuser:
	${EXEC} ${APP_CONTAINER} ${MANAGE_PY} createsuperuser

collectstatic:
	${EXEC} ${APP_CONTAINER} ${MANAGE_PY} collectstatic



# monitoring
.PHONY: monitoring monitoring-down monitoring-logs
monitoring:
	${DC} -f ${MONITORING_FILE} ${ENV} up --build -d

monitoring-down:
	${DC} -f ${MONITORING_FILE} ${ENV} down

monitoring-logs:
	${DC} -f ${MONITORING_FILE} ${ENV} logs -f


# tests
.PHONY: run-test
run-test:
	${EXEC} ${APP_CONTAINER} pytest

