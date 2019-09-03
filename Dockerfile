FROM python:3.7.4-alpine3.10

LABEL maintainer="Paul Butler <docker@paulbutler.org>"

COPY ./requirements.txt /requirements.txt

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual .notify-run_deps build-base python3-dev openssl-dev libffi-dev && \
    pip install -r requirements.txt && \
    apk del .notify-run_deps

EXPOSE 8000
VOLUME /notify-run
WORKDIR /notify-run
CMD [ "gunicorn", "notify_run_server:app", "--bind=0.0.0.0:8000", "--workers=4" ]
