FROM ubuntu

RUN apt-get update
RUN apt-get install -y ruby rubygems ruby-dev build-essential
RUN gem install bundler
ADD config.rb /api-docs/
ADD Gemfile /api-docs/
ADD Gemfile.lock /api-docs/
WORKDIR /api-docs
RUN bundle install
