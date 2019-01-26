#!/bin/bash
set -e

bundle exec rails assets:precompile
bundle exec rails db:migrate

exec "$@"
