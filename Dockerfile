FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y libpq-dev --no-install-recommends && apt-get autoclean -y && apt-get autoremove -y

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . .

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV DATABASE_URL postgres://postgres:@db:5432/

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
