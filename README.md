# Introduction

The docs are generated with [Slate](https://github.com/tripit/slate).


You need a `bundler` Ruby package manager to be installed.
````bash
gem install bundler
````

# Generating API docs

``cd api-docs``

First you need to install the dependencies, if not yet done.

````bash
Igors-Mac:api-docs igor$ bundle install
````

Once you have them, regenerate the docs by invoking:

````bash
Igors-Mac:api-docs igor$ rake build
````

Then copy generated files under `build` dir to a public directory in `api` repository (`api/v1/public`).
