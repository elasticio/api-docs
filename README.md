# Introduction

_This repo is deprecated, all the docs have been moved into api repository_

The docs are generated with [Slate](https://github.com/tripit/slate).

# Generating API docs
You need a `bundler` Ruby package manager to be installed.
````bash
gem install bundler
````

``cd api-docs``

First you need to install the dependencies, if not yet done.

Install ruby-dev
```
sudo apt-get install ruby-dev
```
Then
````bash
Igors-Mac:api-docs igor$ bundle install
````

Once you have them, regenerate the docs by invoking:

````bash
Igors-Mac:api-docs igor$ rake build
````

Then copy generated files under `build` dir to a public directory in `api` repository (`api/v1/public`).
