FROM nginx:stable AS base

WORKDIR /usr/src/app

RUN rm /etc/nginx/nginx.conf

COPY .nginx/.conf /etc/nginx/nginx.conf

FROM base AS dependencies

COPY config.rb /usr/src/app/config.rb
COPY Gemfile /usr/src/app/Gemfile
COPY Rakefile /usr/src/app/Rakefile
COPY source_v1 /usr/src/app/source_v1
COPY source_v2 /usr/src/app/source_v2
COPY docs /usr/src/app/docs

ARG toc_footer="<a href='http://www.elastic.io/en/demo-request/'>Sign Up for a Developer Key</a>"
ARG api_base_url="https://api.elastic.io"
ARG product_name="elastic.io"
ARG logo_url="https://app.elastic.io/img/logo.svg"
ARG repo_name="elasticio"
ARG docs_url="http://docs.elastic.io/docs"

RUN apt-get update && \
    apt-get install -y ruby rubygems ruby-dev build-essential vim && \
    gem install bundler && \
    bundle install && \
    for f in `grep -rl "{{ toc_footer }}" *` ; do sed -i "s%{{ toc_footer }}%$toc_footer%g" $f ; done && \
    for f in `grep -rl "{{ api_base_url }}" *` ; do sed -i "s%{{ api_base_url }}%$api_base_url%g" $f ; done && \
    for f in `grep -rl "{{ product_name }}" *` ; do sed -i "s%{{ product_name }}%$product_name%g" $f ; done && \
    for f in `grep -rl "{{ logo_url }}" *` ; do sed -i "s%{{ logo_url }}%$logo_url%g" $f ; done && \
    for f in `grep -rl "{{ repo_name }}" *` ; do sed -i "s%{{ repo_name }}%$repo_name%g" $f ; done && \
    for f in `grep -rl "{{ docs_url }}" *` ; do sed -i "s%{{ docs_url }}%$docs_url%g" $f ; done && \
    echo "building for api_v1" && \
    echo "copy source_v1 to source" && \
    cp -a ./source_v1 ./source && \
    echo "run middleman build" && \
    bundle exec middleman build && \
    echo "remove dir source" && \
    rm -rf ./source && \
    echo "remove dir v1" && \
    rm -rf ./v1 && \
    echo "copy build to v1" && \
    mv ./build ./v1 && \
    echo "building for api_v2" && \
    echo "copy source_v2 to source" && \
    cp -a ./source_v2 ./source && \
    echo "run middleman build" && \
    bundle exec middleman build && \
    echo "remove dir source" && \
    rm -rf ./source && \
    echo "remove dir v2" && \
    rm -rf ./v2 && \
    echo "copy build to v2" && \
    mv ./build ./v2

FROM base AS release

COPY --from=dependencies /usr/src/app/v1 ./v1
COPY --from=dependencies /usr/src/app/v2 ./v2
COPY --from=dependencies /usr/src/app/docs ./docs

EXPOSE 8000

CMD nginx -g "daemon off;"
