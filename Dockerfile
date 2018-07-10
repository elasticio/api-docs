FROM nginx:stable

WORKDIR /usr/src/app

RUN rm /etc/nginx/nginx.conf

COPY .nginx/.conf /etc/nginx/nginx.conf
COPY config.rb /usr/src/app/config.rb
COPY Gemfile /usr/src/app/Gemfile
COPY Rakefile /usr/src/app/Rakefile
COPY source_v1 /usr/src/app/source_v1
COPY source_v2 /usr/src/app/source_v2

RUN apt-get update && \
    apt-get install -y ruby rubygems ruby-dev build-essential && \
    gem install bundler && \
    bundle install && \
    echo "building for api_v1" && \
    echo "copy source_v1 to source" && \
    cp -a ./source_v1 ./source && \
    echo "run middleman build" && \
    bundle exec middleman build && \
    echo "remove dir source" && \
    rm -rf ./source && \
    echo "remove dir build_v1" && \
    rm -rf ./build_v1 && \
    echo "copy build to build_v1" && \
    mv ./build ./build_v1 && \
    echo "building for api_v2" && \
    echo "copy source_v2 to source" && \
    cp -a ./source_v2 ./source && \
    echo "run middleman build" && \
    bundle exec middleman build && \
    echo "remove dir source" && \
    rm -rf ./source && \
    echo "remove dir build_v2" && \
    rm -rf ./build_v2 && \
    echo "copy build to build_v2" && \
    mv ./build ./build_v2

EXPOSE 80

CMD nginx -g "daemon off;"
