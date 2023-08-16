# Use an appropriate base image for your application
FROM python:2.7

ENV DockerHOME=/home/app/webapp

# Set environment variables

WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN pip install psycopg2
EXPOSE 8080
CMD notejam/manage.py syncdb --noinput && notejam/manage.py migrate && notejam/manage.py runserver 0.0.0.0:8080
