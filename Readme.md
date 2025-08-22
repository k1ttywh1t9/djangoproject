# Django Boilerplate with Docker, Makefile, and PostgreSQL

## Overview

This is a boilerplate Django project configured with Docker Compose for containerization, a Makefile for common tasks, and PostgreSQL as the database. It provides a quick start for Django projects with production-ready configurations.

## Features

- Django 4.x/5.x ready
- PostgreSQL database
- Dockerized environment
- Makefile for common commands
- Environment variables configuration
- Pre-configured settings for development and production
- Static files and media files handling
- WSGI and ASGI ready

## Prerequisites

- Docker (20.10.0+)
- Docker Compose (1.29.0+)
- Python (3.8+)
- Make (optional but recommended)

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/django-docker-boilerplate.git
cd django-docker-boilerplate
```

### 2. Set up environment variables

Create a `.env` file in the project root:

```bash
cp .env.example .env
```

Edit the `.env` file with your configuration:

```ini
# Django
SECRET_KEY=your-secret-key-here
DEBUG=1
ALLOWED_HOSTS=localhost,127.0.0.1

# Database
POSTGRES_DB=yourdbname
POSTGRES_USER=yourdbuser
POSTGRES_PASSWORD=yourdbpassword
POSTGRES_HOST=db
POSTGRES_PORT=5432

# Email (optional)
EMAIL_HOST=your-smtp-host
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@example.com
EMAIL_HOST_PASSWORD=your-email-password
EMAIL_USE_TLS=1
```

### 3. Build and start the containers

```bash
make up
```

This will:
- Build the Docker images
- Start the Django and PostgreSQL containers
- Run migrations
- Create a superuser (if not exists)

### 4. Access the application

- Django development server: http://localhost:8000
- Admin panel: http://localhost:8000/admin
- PostgreSQL: accessible on port 5432 (from within Docker network)

## Makefile Commands

The project includes a Makefile with common commands:

| Command               | Description                                      |
|-----------------------|--------------------------------------------------|
| `make up`             | Build and start containers in detached mode      |
| `make down`           | Stop and remove containers                       |
| `make build`          | Build containers                                 |
| `make start`          | Start containers                                 |
| `make stop`           | Stop containers                                  |
| `make restart`        | Restart containers                               |
| `make logs`           | View container logs                              |
| `make shell`          | Access Django shell in container                 |
| `make shell-db`       | Access PostgreSQL shell                          |
| `make migrate`        | Run Django migrations                            |
| `make makemigrations` | Create new migrations                            |
| `make collectstatic`  | Collect static files                             |
| `make test`           | Run tests                                        |
| `make superuser`      | Create a superuser                               |
| `make clean`          | Remove pycache, migrations, and static files    |

## Project Structure

```
.
├── .env.example                # Environment variables template
├── .gitignore
├── Makefile                    # Make commands
├── README.md                   # This file
├── docker-compose.yml          # Docker compose configuration
├── requirements
│   ├── base.txt               # Base requirements
│   ├── development.txt        # Development-specific requirements
│   └── production.txt         # Production-specific requirements
└── src                         # Django project root
    ├── manage.py
    ├── Dockerfile             # Django Dockerfile
    ├── entrypoint.sh          # Entrypoint script
    └── your_project_name      # Main Django app
        ├── settings
        │   ├── base.py       # Base settings
        │   ├── development.py # Development settings
        │   └── production.py # Production settings
        ├── urls.py
        ├── asgi.py
        └── wsgi.py
```

## Database Configuration

The project is pre-configured to use PostgreSQL with these default settings (can be changed in .env):

- Database: `yourdbname`
- User: `yourdbuser`
- Password: `yourdbpassword`
- Host: `db` (Docker service name)
- Port: `5432`

## Deployment

For production deployment:

1. Set `DEBUG=0` in `.env`
2. Update `ALLOWED_HOSTS` with your domain
3. Run:

```bash
make collectstatic
make migrate
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)