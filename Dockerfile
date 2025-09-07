FROM python:3.11.13-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV VIRTUALENV_PYTHON_TCL=false


WORKDIR /app

RUN apk update && \
    apk add --no-cache python3-dev \
	gcc \
	musl-dev \
    postgresql-dev \
    nmap

ADD pyproject.toml /app

RUN pip install --no-cache-dir --upgrade pip setuptools wheel virtualenv
RUN pip install poetry

RUN poetry config virtualenvs.create false
RUN poetry install --no-root --no-interaction --no-ansi

COPY . /app/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x ./entrypoint.sh