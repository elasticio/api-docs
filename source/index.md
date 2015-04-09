---
title: API Reference

language_tabs:
  - curl

toc_footers:
  - <a href='https://app.elastic.io'>Sign Up for a Developer Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the elastic.io REST API!

# Authentication

You authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

````curl
curl https://api.elastic.io/v1/users \
   -u {USERNAME}:{PASSWORD}
````

# Users

## Retrieve your user

> Example Request:

```curl
curl https://api.elastic.io/v1/users \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com"
}
```

This endpoint registers a new user.

### HTTP Request

`GET https://api.elastic.io/v1/users`


#### Returns

Returns a user object if the call succeeded.

# Recipes

## Retrieve all Recipes

> Example Request:


```curl
curl https://api.elastic.io/v1/recipes/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
[
    {
        "id": "google_contacts_to_mailjet",
        "title": "Google Contacts to Mailjet"
    },
    {
        "id": "mandrill_to_keenio",
        "title": "Mandrill to Keen.io"
    },
    {
        "id": "salesforce_to_debitoor",
        "title": "Salesforce to Debitoor"
    }
]
```

This endpoint retrieves all available recipes.

### HTTP Request

`GET https://api.elastic.io/v1/recipes/`

### Returns

Returns all recipe's available for activation. Please note that in order to get all the data of a recipe you would need to get a recipe by id.

## Retrieve a Recipe


> Example Request:


```curl
curl https://api.elastic.io/v1/recipes/{RECIPE_ID} \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
    "id": "53d61965a6b9e9183f000001",
    "title": "Synchronise Amazon MWS and your Shopware data",
    "description": "Synchronises products and orders between Shopware and Amazon",
    "accounts": {
        "amazonmws": {
            "credentials": {
                "type" : "object",
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
        },
        "shopware": {
            "credentials": {
                "type": "object",
                "properties" : {
                    "baseUrl": {
                        "type": "string",
                        "description": "Your Shopware domain"
                    },
                    "user": {
                        "type": "string",
                        "description": "Your username"
                    },
                    "password": {
                        "type": "string",
                        "description": "Your Password"
                    }
                },
                "required": ["baseUrl", "user", "password"]
            }
        }
    }
}
```

This endpoint retrieves a recipe by given ID.

### HTTP Request

`GET https://api.elastic.io/v1/recipes/{RECIPE_ID}`

### URL Parameters

Parameter | Description
--------- | -----------
RECIPE_ID | The ID of the recipe to retrieve

### Returns

Returns a recipe's metadata object if the call succeeded. The returned object will have an recipe's title and account metadata.

## Activate a Recipe

> Example Request:

```curl
curl https://api.elastic.io/v1/recipes \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "recipeId": "53d61965a6b9e9183f000001",
       "accounts": {
           "amazonmws": {
               "credentials": {
                   "sellerId": "asdasd7a7sd60asasdasd",
                   "marketplace": "us",
                   "mwsAuthToken": "345lkj34k5j3l45k"
               }
           },
           "shopware": {
               "credentials": {
                   "baseUrl": "mysuperawesomeshop.com",
                   "user": "text@example.com",
                   "password": "secret"
               }
           }
       }
   }'
```

> Example Response:

```json
{
  "tasks" : [
    {
      "id" : "540492e623773659c5000002",
      "title" : "Synchronize Shopware Products to Amazon"
    },
    {
      "id" : "540490c023773659c5000001",
      "title" : "Synchronize Amazon Orders to Shopware"
    }
  ]
}
```

This endpoint creates tasks from a given recipe.

### HTTP Request

`POST https://api.elastic.io/v1/recipes`

### Arguments

Parameter | Description
--------- | -----------
accounts | A hash of key/value pairs representing user's account credentials. The keys are the ids of connectors and the values are the credentials.

