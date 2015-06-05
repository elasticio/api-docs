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

This endpoint returns your own user.

### HTTP Request

`GET https://api.elastic.io/v1/users`


#### Returns

Returns a user object if the call succeeded.

## Create a user

> Example Request:

```curl
curl https://api.elastic.io/v1/users \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "first_name": "John",
      "last_name": "Doe",
      "email": "test@example.com",
      "password": "secret",
      "company": "Doe & Partners"
   }'
```

> Example Response:

```json
{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com",
  "company": "Doe & Partners",
  "api_secret":"7a00b1ec-a0a8-4cea-84d2-d26052c8b788"
}
```

This endpoint registers a new user.

### HTTP Request

`POST https://api.elastic.io/v1/users`

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
first_name | yes | The user's first name
last_name | yes | The user's last name
email | yes | The user's email
password | yes | The user's password
company | no | The user's company

### Returns

A created user object.

New user objects will be provided with an ``id`` and ``api_secret`` fields - these values cannot be created or edited by clients.

The ``api_secret`` field is used to communicate with the API on user's behalf.

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


#SSH keys

## Get keys list


> Example Request:


```curl
curl https://api.elastic.io/v1/sshkey/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "sshkey": [
    {
      "title": "keyTitle",
      "fingerPrint": "fingerprint",
      "_id": "key_id"
    }
  ]
}
```

This endpoint retrieves list of user's keys

### HTTP Request

`GET https://api.elastic.io/v1/sshkey/`


### Returns

Returns a ssh key's metadata object if the call succeeded. The returned object will have an keys's title, id and fingerPrint metadata.


## Add new key


> Example Request:


```curl
curl https://api.elastic.io/v1/sshkey/ \
   -u {USERNAME}:{PASSWORD} \
   -H POST \
   -d '{"key": "ssh-rsa key", "title":"key title"}' \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "sshkey":  {
      "title": "key title",
      "fingerPrint": "fingerprint",
      "_id": "key_id"
  }
}
```

This endpoint adds new key to list of user's keys

### HTTP Request

`POST https://api.elastic.io/v1/sshkey/`


### Arguments

Parameter | Description
--------- | -----------
key       | valid ssh public key
title     | key title


### Returns

Returns a ssh key's metadata object if the call succeeded. The returned object will have an keys's title, id and fingerPrint metadata.


## Delete key


> Example Request:


```curl
curl https://api.elastic.io/v1/sshkey/{id} \
   -u {USERNAME}:{PASSWORD} \
   -X DELETE
   -H 'Accept: application/json'
```

> Example Response:

```json
{}
```

This endpoint delete specified ssh key

### HTTP Request

`DELETE https://api.elastic.io/v1/sshkey/{id}`


### Arguments

Parameter | Description
--------- | -----------
id        | key id


### Returns

Returns empty response on success request


#Repositories

## Get custom component's repositories list


> Example Request:


```curl
curl https://api.elastic.io/v1/repos/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "components": {
    "component_id": {
        "name": "title"
    }
  }
  
}
```

This endpoint retrieves list of user's components

### HTTP Request

`GET https://api.elastic.io/v1/repos/`


### Returns

Returns repositories metadata object if the call succeeded.


## Get public components repositories list


> Example Request:


```curl
curl https://api.elastic.io/v1/repos/public \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "components": {
    "component_id": {
        "name": "title"
    }
  }
  
}
```

This endpoint retrieves list of public components

### HTTP Request

`GET https://api.elastic.io/v1/repos/public`


### Returns

Returns repositories metadata object if the call succeeded.


## Create repository


> Example Request:


```curl
curl https://api.elastic.io/v1/repos/ \
   -u {USERNAME}:{PASSWORD} \
   -X POST \
   -d '{"name": "repository name"}' \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
  "repo": {
    "name":"repository name",
    "_id": "repo_id"
  }
}
```

This endpoint creates new custom repository

### HTTP Request

`POST https://api.elastic.io/v1/repos/`

Parameter | Description
--------- | -----------
name      | repository title (optional)
teamId    | team, repo will belong to (optional, will create new, or use existing for user one)


### Returns

Returns repositories metadata object if the call succeeded.


#Teams

## Get user's teams


> Example Request:


```curl
curl https://api.elastic.io/v1/teams/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
[
    {
        "_id":"team_id",
        "name":"team name",
        "memberIds":["member_id"]
    }
]
```

This endpoint retrieves list of user's teams

### HTTP Request

`GET https://api.elastic.io/v1/teams/`


### Returns

Returns teams metadata object if the call succeeded.


## Create team


> Example Request:


```curl
curl https://api.elastic.io/v1/teams/ \
   -u {USERNAME}:{PASSWORD} \
   -X POST \
   -d '{"name":"team name"}' \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
    "_id":"team_id",
    "name":"team name",
    "memberIds":["member_id"]
}
```

This endpoint creates new team for user

### HTTP Request

`POST https://api.elastic.io/v1/teams/`

Parameter | Description
--------- | -----------
name      | team title (optional)

### Returns

Returns teams metadata object if the call succeeded.