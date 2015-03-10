# Introduction

Welcome to the elastic.io REST API v.1!

# Authentication

You should authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

````curl
curl https://api.elastic.io/v1/ \
   -u {USERNAME}:{PASSWORD}
````


# Users

## User registration.     
> Example Request:

   **__POST__** `/v1/user/register`
   
   ```json
  {
    "email": "chiki.pikov@ani.me",
    "password": "animakisyakisraki",
    "name": "Chiki Pikov", 
    "address": "Montenegro"
  }
   ```
   
   **_note_**: all fields are required 
   
> Response:
   
   **200**:
   
   ```json
   {
      "id": "23kjhj32kj4hkj2h34234",
      "apiSecret": "super-secret-api-secret" 
   }
   ```
   **_note_**: _apiSecret_ - generated unique api key for this User
   
   **40x**:
   
   ```json
   {
     "message": "Some required fields was not provided"
   }
   ```

3. **_Shopware_** make request to get recipe schema using hardcoded id `amazon_to_shopware`
   Request:

   **__GET__** `/v1/recipe/:recipeId`
   
   ```json
   headers : {
      "X-Api-Secret" : "super-secret-api-secret"
   }
   ```
   
   Response:
   
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
   
4. **_User_** fills plugin form with account data and submit it to **_API_**
   Request:

   **__POST__** `/v1/recipe`
   
   ```json
   headers : {
      "X-Api-Secret" : "super-secret-api-secret"
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
   
   Response:
   
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
 


# Generating API docs

``cd api``

First you need to install the dependencies, if not yet done.

````bash
Igors-Mac:api igor$ bundle install
````

Once you have them, regenerate the docs by invoking:

````bash
Igors-Mac:api igor$ rake build
````
