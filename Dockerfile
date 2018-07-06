FROM ubuntu

WORKDIR /api-docs

RUN apt-get update && \
    apt-get install -y ruby rubygems ruby-dev build-essential && \
    gem install bundler

COPY config.rb /api-docs/
COPY Gemfile /api-docs/
COPY Gemfile.lock /api-docs/

RUN bundle install
