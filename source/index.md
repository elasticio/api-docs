# Introduction

Welcome to the elastic.io REST API v.1!

# Authentication

You should authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

> Example request

   ```curl
   curl https://api.elastic.io/v1/ -u {USERNAME}:{PASSWORD}
   ```

# Users

## Register new user

> Example request:

   ```json
  {
    "email": "chiki.pikov@ani.me",
    "password": "animakisyakisraki",
    "first_name": "John",
    "last_name": "Doe",
    "address": "Montenegro"
  }
   ```

> Response:

> **200**:

   ```json
   {
      "id": "23kjhj32kj4hkj2h34234",
      "api_secret": "super-secret-api-secret"
   }
   ```

> **40x**:

   ```json
   {
     "message": "Some required fields was not provided"
   }
   ```

### HTTP request

`POST https://api.elastic.io/v1/users`

### Arguments

Parameter | Description
--------- | -----------
email | User’s email address.
password | User's password
first_name | User’s first name.
last_name | User’s last name.
address | User's address

**_note_**: all fields are required


### Returns

Returns a user object if the call succeeded. The returned object will have an API secret used to make requests on user's behalf.

**_note_**: _api_secret_ - generated unique api key for this User

# Recipes

## Get recipe schema

> Example request headers:

   ```json
   {
      "Authorization" : "Basic dXNlcjpzZWNyZXQ="
   }
   ```

> Response:

> **200**:

   ```json
{
    "id": "some-recipe-id",
    "title": "Something to Something recipe",
    "description": "Smart and long recipe description",
    "accounts": {
        "amazonmws": {
            "credentials": {
                "sellerId": {
                    "type": "string",
                    "description": "Seller ID",
                    "required": true
                },
                "marketplace": {
                    "type": "string",
                    "description": "Marketplace",
                    "required": true,
                    "options": [
                        "china",
                        "france",
                        "germany",
                        "india",
                        "italy",
                        "japan",
                        "spain",
                        "usa"
                    ]
                },
                "mwsAuthToken": {
                    "type": "string",
                    "description": "MWS Auth Token"
                }
            }
        },
        "shopware": {
            "credentials": {
                "baseUrl": {
                    "type": "string",
                    "description": "Your Shopware domain",
                    "required": true
                },
                "user": {
                    "type": "string",
                    "description": "Your login",
                    "required": true
                },
                "password": {
                    "type": "string",
                    "description": "Your API key",
                    "required": true
                }
            }
        }
    }
}
   ```

### HTTP request

   `GET https://api.elastic.io/v1/recipes/{recipeId}`

### URL arguments

Parameter | Description
--------- | -----------
recipeId | Recipe id

### Returns

Returns a recipe's metadata object if the call succeeded. The returned object will have an recipe's title and account metadata.

## Activate recipe

This endpoint creates tasks from a given recipe.

> Example request:

   ```json
{
  "Authorization" : "Basic dXNlcjpzZWNyZXQ="
}

{
  "accounts" : {
    "amazonmws" : {
       "credentials": {
          "sellerId": "asdasd7a7sd60asasdasd",
          "marketplace": "china",
          "mwsAuthToken": "345lkj34k5j3l45k"
       }
    },
    "shopware": {
       "credentials": {
          "baseUrl": "even-more.me",
          "user": "ani.maki@mail.com",
          "password": "123213123123"
       }
    }
}
   ```

> Response:

> **200**:

   ```json
   {
      "message": "Recipe was successfylly created"
   }
   ```

> **40x**:

   ```json
   {
      "message": "some error message"
   }
   ```

### HTTP request

`POST https://api.elastic.io/v1/recipes`

### Arguments

Parameter | Description
--------- | -----------
accounts | Hash of credential fields provided by `GET /v1/recipes/{recipeId}`


### Returns

Returns a recipe's tasks array.

**_note_**: Possible error messages are:

* wrong api-secret
* no recipe with provided id found
* wrong account details (It's that we are make acc verification here)

# Generating API docs

`cd api`

First you need to install the dependencies, if not yet done.

`bundle install`

Once you have them, regenerate the docs by invoking:

`rake build`
