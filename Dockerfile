FROM amd64/ruby:2.7

ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ENV RACK_ENV production

ADD Gemfile* $APP_ROOT/

RUN gem install bundler && \
    bundle config set path vendor/bundle && \
    bundle install --jobs 3

COPY . $APP_ROOT

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "config.ru"]

