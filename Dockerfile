FROM nginx:stable AS base
WORKDIR /usr/src/api-docs
COPY src/api-docs/.nginx/.conf /etc/nginx/nginx.conf
COPY src/api-docs/docs ./docs

FROM base AS dependencies
COPY src/api-docs/source ./source
COPY src/api-docs/config.rb ./config.rb
COPY src/api-docs/Gemfile ./Gemfile
COPY src/api-docs/Rakefile ./Rakefile
RUN apt-get update && \
    apt-get install -y ruby rubygems ruby-dev build-essential && \
    gem install bundler && \
    bundle install && \
    bundle exec middleman build && \
    rm -rf ./source && \
    rm -rf ./v2 && \
    mv ./build ./v2

FROM base AS release
COPY --from=dependencies /usr/src/api-docs/v2 ./v2

EXPOSE 8000
CMD nginx -g "daemon off;"
