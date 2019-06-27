# Introduction

The docs are generated with [Slate](https://github.com/tripit/slate).

# How to edit/add resources documentation to existing api docs?

Api-docs for api version 2 is placed at directory `source`.

All documentized resources located in directories `source_v{API_VER}/include`. You can edit existing files there or create new files (resources).

# How to create new api docs for new api version?
For example, you want to create docs for new api of version 15.
1. In `api-docs` root, create directory called `source_15` and add there `Slate` initial files (or copy/paste from some another `source_{API_VER}` directory)
2. In `./.nginx/.conf` add new `location` directive inside `server` directive:
```
location /api-v15 {
    alias /usr/src/app/build_v15;
}
```
3. Add these commands at the end of `RUN` command at image of `dependencies` at `./Dockerfile`:
```
cp -a ./source_v15 ./source && \
bundle exec middleman build && \
rm -rf ./source && \
rm -rf ./build_v15 && \
mv ./build ./build_v15
```
4. Add this command to the list of `COPY` commands at image of `release` at `./Dockerfile`:
```
COPY --from=dependencies /usr/src/app/build_v15 ./build_v15
```
(replace v15 with your api version)

# How to customize api docs for a special customer?
In case the api-docs have to be "re-branded" for a special customer, there are a few build-arguments which point by default to elastic.io original values:
- toc_footer: 
  The text or HTML-Fragment displayed at the bottom of the Table of Contents 
  (default: Link to sign-up for a developer key)
- api_base_url: Url of the customers API (default: https://api.elastic.io)
- product_name: Name of this API product (default: elastic.io)
- logo_url: URL to refer the customers logo (default: https://app.elastic.io/img/logo.svg)
- repo_name: Name of githaub repository name (default: elasticio)
- docs_url: Link to the main documentation (default: http://docs.elastic.io/docs)

So a complete build for a customer overwriting everything may be e.g.:
```
docker build -t apidocs:telekom \
        --build-arg "toc_footer=Some Footer Text" \
        --build-arg "api_base_url=http://api.customer.org" \
        --build-arg "product_name=Customer API Name" \
        --build-arg "logo_url=https://customer.logo.url/svg-image.svg" \
        --build-arg "repo_name=customer-repo" \
        .
```

# How to check, what is in the `master`

1. Run the `api-docs`:
```shell
docker run --rm -p 8000:8000 -d elasticio/api-docs:master
```

2. Open in your browser: http://localhost:8000/

3. Ensure that everything is ok.

4. Stop the `api-docs`:
```shell
docker stop api-doc-master
```




# How to build and see api-docs static website locally?

## 1. Using Docker

1. Build docker image:
```
docker build -t api-docs .
```
2. Run container of newly built docker image (for example, at port `8081`)
```
docker run --rm -p 8081:8000 -d api-docs
```
3. Access docs for api vesion at `localhost:8081`



## 2. "Manually"

1. Install required tools
    ```
    apt-get update && \
        apt-get install -y ruby rubygems ruby-dev build-essential && \
        gem install bundler && \
        bundle install
    ```
2. Create directory `source` and paste there files from `source_{SOME_API_VER}`
3. Run
    ```
    bundle exec middleman build
    ```
This command will create directory `build` with static website files.

4. Open `build/index.html` in browser
