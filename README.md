# docker-guniflask

PCIC's base Docker image for running a Flask app under gunicorn

## Usage

Use this image as a base image for any application that runs as a WSGI
app that you want to deploy

Start your Dockerfile with:

```
FROM pcic/guniflask
```

Install your package into the /app directory and then set the
`APP_MODULE` environment variable to the module path of your WSGI app
function.

For example:

```
RUN pip3 install -r requirements.txt
RUN pip3 install .
ENV APP_MODULE ce.wsgi:app
```

Done. You can basically deploy your app to production with a four line
Dockerfile.

This image sets the Docker CMD to execute gunicorn and bind to port 8000.

## gunicorn config

The docker file contains a `gunicorn.conf` file that is set up so that
one can tune gunicorn settings when running the container. Simply set
any environment variable GUNICORN_[setting], where `setting` is any of
the parameters in [this
list](http://docs.gunicorn.org/en/latest/settings.html)
