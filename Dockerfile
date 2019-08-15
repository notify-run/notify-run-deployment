FROM python:3.7.4

MAINTAINER Paul Butler "docker@paulbutler.org"

COPY ./requirements.txt /requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8000
CMD [ "gunicorn", "notify_run_server:app", "--bind=0.0.0.0:8000", "--workers=4" ]

