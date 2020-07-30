FROM nginx:mainline AS base
WORKDIR /usr/src/api-docs
COPY .nginx/.conf /etc/nginx/nginx.conf
COPY docs ./docs

FROM base AS dependencies

ARG toc_footer="<a href='http://www.elastic.io/en/demo-request/'>Sign Up for a Developer Key</a>"
ARG api_base_url="https://api.elastic.io"
ARG product_name="elastic.io"
ARG logo_url="https://app.elastic.io/img/logo.svg"
ARG repo_name="elasticio"
ARG docs_url="http://docs.elastic.io/"
ARG favicon_url="https://app.elastic.io/favicon.ico"

RUN apt-get update && \
    apt-get install -y ruby rubygems ruby-dev build-essential && \
    gem install bundler -v '~> 1.17.3'

COPY source ./source
COPY config.rb ./config.rb
COPY Gemfile ./Gemfile
COPY Rakefile ./Rakefile
COPY docs ./docs

RUN bundle install

RUN for f in `grep -rl "{{ toc_footer }}" *` ; do sed -i "s%{{ toc_footer }}%$toc_footer%g" $f ; done
RUN for f in `grep -rl "{{ api_base_url }}" *` ; do sed -i "s%{{ api_base_url }}%$api_base_url%g" $f ; done
RUN for f in `grep -rl "{{ product_name }}" *` ; do sed -i "s%{{ product_name }}%$product_name%g" $f ; done
RUN for f in `grep -rl "{{ logo_url }}" *` ; do sed -i "s%{{ logo_url }}%$logo_url%g" $f ; done
RUN for f in `grep -rl "{{ repo_name }}" *` ; do sed -i "s%{{ repo_name }}%$repo_name%g" $f ; done
RUN for f in `grep -rl "{{ docs_url }}" *` ; do sed -i "s%{{ docs_url }}%$docs_url%g" $f ; done
RUN for f in `grep -rl "{{ favicon_url }}" *` ; do sed -i "s%{{ favicon_url }}%$favicon_url%g" $f ; done

RUN bundle exec middleman build
RUN rm -rf ./source && \
    rm -rf ./v2 && \
    mv ./build ./v2

FROM base AS release
COPY --from=dependencies /usr/src/api-docs/v2 ./v2
COPY --from=dependencies /usr/src/api-docs/docs ./docs

RUN mkdir -p /var/cache/nginx && \
    chown -R nginx:nginx /usr/src/api-docs /var/cache/nginx

USER nginx

EXPOSE 8000
