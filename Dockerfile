# NOTE: This will give you a demo server that uses a sqlite backend, but
# data (channels, subscriptions, and messages) WILL NOT persist after
# the server is shut down. If you are more familiar with Docker than I
# am, feel free to submit a PR providing instructions to make this use
# Docker volumes to persist data between server restarts.

FROM python:3.7.4

MAINTAINER Paul Butler "docker@paulbutler.org"

COPY ./requirements.txt /requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8000
CMD [ "gunicorn", "notify_run_server:app", "--bind=0.0.0.0:8000", "--workers=4" ]
