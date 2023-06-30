#!/usr/bin/env bash
set -o errexit  # exit on error

echo "Installing python dependencies"
pip3 install -U pip
pip3 install -r requirements.txt

echo "Building JS & CSS"
npm install
npm run build

echo "Collecting staticfiles"
python manage.py collectstatic --noinput

echo "Running database migrations"
python manage.py migrate --noinput