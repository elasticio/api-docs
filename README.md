# Introduction

The docs are generated with [Slate](https://github.com/tripit/slate).

# How to edit/add resources documentation to existing api docs?
Api-docs for api version 1 is placed at directory `source_v1`.

Api-docs for api version 2 is placed at directory `source_v2`.

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

# How to build and see api-docs static website locally?

## 1. Using Docker

1. Build docker image:
```
docker build -t api-docs .
```
2. Run container of newly built docker image (for example, at port `8081`)
```
docker run -p 8081:8000 -d api-docs
```
3. Access docs for api vesion 1 at `localhost:8081/api-v1`, for api vesion 2 at `localhost:8081/api-v2`



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
