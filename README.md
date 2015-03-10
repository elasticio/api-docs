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

   **_note_**: all fields are required

> Response:

   **200**:

   ```json
   {
      "id": "23kjhj32kj4hkj2h34234",
      "api_secret": "super-secret-api-secret"
   }
   ```
   **_note_**: _api_secret_ - generated unique api key for this User

   **40x**:

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

### Returns

Returns a user object if the call succeeded. The returned object will have an API secret used to make requests on user's behalf.

# Recipes

## Get recipe schema

> Example request:

   ```json
   headers : {
      Authorization : Basic dXNlcjpzZWNyZXQ=
   }
   ```

> Response:

   **200**:

   ```json
    {
        "title": "Recipe JSON schema",
        "type": "object",
        "properties": {
            "accounts" : {
                "type": "object",
                "properties": {
                    "amazonmws": {
                        "type": "object",
                        "properties": {
                            "credentials": {
                                "type": "object",
                                "properties": {
                                    "sellerId": {
                                        "type": "string",
                                        "description": "Seller ID"
                                    },
                                    "marketplace": {
                                        "type": "string",
                                        "description": "Marketplace",
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
                                },
                                "required": ["sellerId", "marketplace"]
                            }
                        }
                    },
                    "shopware": {
                        "type": "object",
                        "properties": {
                            "credentials": {
                                "type": "object",
                                "properties": {
                                    "baseUrl": {
                                        "type": "string",
                                        "description": "Your Shopware domain"
                                    },
                                    "user": {
                                        "type": "string",
                                        "description": "Your login"
                                    },
                                    "password": {
                                        "type": "string",
                                        "description": "Your API key"
                                    }
                                },
                                "required": ["baseUrl", "user", "password"]
                            }
                        }
                    }
                }
            }
        }
    }
   ```

### HTTP request

   `GET https://api.elastic.io/v1/recipes/{recipeId}`

## Activate recipe

Submit recipe data to activate it and create nested tasks.

> Example request:

   ```json
   headers : {
      Authorization : Basic dXNlcjpzZWNyZXQ=
   }

   {
      "accounts" : {
      	"amazonmws" : {
           "credentials": {
              "sellerId": "asdasd7a7sd60asasdasd",
              "marketplace": "china",
              "mwsAuthToken": "345lkj34k5j3l45k"
           },
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

   **200**:

   ```json
   {
      "message": "Recipe was successfylly created"
   }
   ```

   **40x**:

   ```json
   {
      "message": "some error message"
   }
   ```
   **_note_**: Possible error messages are:
   - wrong api-secret
   - no recipe with provided id found
   - wrong account details (It's that we are make acc verification here)

### HTTP request

`POST https://api.elastic.io/v1/recipes`

# Generating API docs

``cd api``

First you need to install the dependencies, if not yet done.

````bash
user@host:api user$ bundle install
````

Once you have them, regenerate the docs by invoking:

````bash
user@host:api user$ rake build
````
