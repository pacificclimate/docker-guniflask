FROM pcic/geospatial-python

ADD . /app
WORKDIR /app

RUN pip3 install gunicorn

EXPOSE 8000

# gunicorn.conf is set up so that one can tune gunicorn settings when
# running the container by setting environment an variable
# GUNICORN_[setting], where setting is any of the parameters in this
# list: http://docs.gunicorn.org/en/latest/settings.html
#
# E.g. docker run -e GUNICORN_WORKERS=10 -e GUNICORN_PORT=8000 -e GUNICORN_BIND=0.0.0.0:8000 ...

# APP_MODULE should be set to the module path of your WSGI app function
# E.g. docker run -e APP_MODULE=pdp.wsgi:frontend
CMD gunicorn --config gunicorn.conf --log-config logging.conf -b ":8000" $APP_MODULE
