#!/bin/bash
# Fail fast
set -e

# Migraciones
python manage.py migrate --noinput

# Archivos estáticos
python manage.py collectstatic --noinput

# Arrancar gunicorn en el puerto que exige Railpack ($PORT)
gunicorn ambos_norte.wsgi:application --bind 0.0.0.0:$PORT