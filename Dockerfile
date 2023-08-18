FROM python:2.7
RUN apt-get update && apt-get install -y docker-ce
ENV DockerHOME=/home/app/webapp \
    DB_ENGINE='django.db.backends.postgresql_psycopg2' \
    DB_NAME='postgres' \
    DB_USER='postgres' \
    DB_PASSWORD='postgres' \
    DB_HOST='postgres-host' \
    DB_PORT='5432'
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt 
RUN pip install psycopg2
EXPOSE 8080
CMD notejam/manage.py syncdb --noinput && notejam/manage.py migrate && notejam/manage.py runserver 0.0.0.0:8080
