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

## Retrieve all keys


> Example Request:


```curl
curl https://api.elastic.io/v1/sshkey/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
[
  {
    "id": "54982ee6bdf2a2030000000f",
    "title": "My Key",
    "fingerprint": "fingerprint",
    "user_id": "user_id",
    "key":"ssh_key"
  }
]
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
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "key": "ssh-rsa YOUR KEY GOES HERE,
       "title": "My Key"
   }'
```

> Example Response:

```json
{
  "id": "54982ee6bdf2a2030000000f",
  "title": "My Key",
  "fingerprint": "fingerprint",
  "user_id": "user_id",
  "key":"ssh_key"
}
```

This endpoint adds new key to list of user's keys

### HTTP Request

`POST https://api.elastic.io/v1/sshkey/`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
key       | yes | valid RSA or DSA SSH public key
title     | no | key title


### Returns

Returns a ssh key's metadata object if the call succeeded. The returned object will have an keys's title, id and fingerPrint metadata.


## Delete a key


> Example Request:


```curl
curl https://api.elastic.io/v1/sshkey/{KEY_ID} \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json' \
   -X DELETE
```

> Example Response:

```json
{}
```

This endpoint delete specified ssh key

### HTTP Request

`DELETE https://api.elastic.io/v1/sshkey/{ID}`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
KEY_ID    | yes | Key ID


### Returns

Returns empty response on success request


# Components

## Retrieve private components


> Example Request:


```curl
curl https://api.elastic.io/v1/components/mine \
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

`GET https://api.elastic.io/v1/components/mine`


### Returns

Returns repositories metadata object if the call succeeded.


## Retrieve public components


> Example Request:


```curl
curl https://api.elastic.io/v1/components \
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

`GET https://api.elastic.io/v1/components/public`


### Returns

Returns repositories metadata object if the call succeeded.


#Repositories

## Get user's repositories

> Example Request:

```curl
curl https://api.elastic.io/v1/repos/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
[
  {
    "id": "555c5ade13c2298a9d32fe67",
    "name": "testrepo",
    "team_id": "5538bc1c9c0f0522391900d4"
  }
]
```

### HTTP Request

`GET https://api.elastic.io/v1/repos/`

### Returns

Returns repositories metadata object if the call succeeded.

## Get user's repository

> Example Request:

```curl
curl https://api.elastic.io/v1/repos/{ID} \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json'
```

> Example Response:

```json
  {
    "id": "555c5ade13c2298a9d32fe67",
    "name": "testrepo",
    "team_id": "5538bc1c9c0f0522391900d4"
  }
```

### HTTP Request

`GET https://api.elastic.io/v1/repos/{REPO_ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | repository id

### Returns

Returns repositories metadata object if the call succeeded.


## Create repository


> Example Request:


```curl
curl https://api.elastic.io/v1/repos/ \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json' -d '
   {
       "name": "My Repo"
   }'
```

> Example Response:

```json
{
    "name":"repository name",
    "id": "repo_id",
    "team_id": "team_id",
     "is_public": false
}
```

This endpoint creates new custom repository

### HTTP Request

`POST https://api.elastic.io/v1/repos/`

Parameter | Required | Description
--------- | -----------| -----------
name      | no | repository name
team_id   | no | team this repo will belong to


### Returns

Returns repositories metadata object if the call succeeded.


## Delete repository


> Example Request:


```curl
curl https://api.elastic.io/v1/repos/{REPO_ID} \
   -u {USERNAME}:{PASSWORD} \
   -X DELETE \
   -H 'Accept: application/json'
```

> Example Response:

```json
{}
```

This endpoint delete repository

### HTTP Request

`DELETE https://api.elastic.io/v1/repos/{ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID        | yes      | repository id

#Tasks

## Start a Task

> Example Request:


```curl
curl -X POST https://api.elastic.io/v1/tasks/start/{TASK_ID} \
   -u {USERNAME}:{PASSWORD}
```

> Example Response:

```json
{
  "id": "5538bd9646208d02b3000005",
  "status":"active"
}
```

This endpoint starts a given integration task.

### HTTP Request

`POST https://api.elastic.io/v1/tasks/start/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to start


### Returns

Result of starting the task.

## Stop a Task


> Example Request:


```curl
curl -X POST https://api.elastic.io/v1/tasks/stop/{TASK_ID} \
   -u {USERNAME}:{PASSWORD}
```

> Example Response:

```json
{
  "id": "5538bd9646208d02b3000005",
  "status":"inactive"
}
```

This endpoint stops a given integration task.

### HTTP Request

`POST https://api.elastic.io/v1/tasks/stop/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to stop


### Returns

Result of stopping the task.

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
        "id":"55083c567aea6f030000001a",
        "name":"My team",
        "members":[
            "5508411b34e5ac0300000019", 
            "510fc14d173cff0200000003"
        ]
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
 curl https://api.elastic.io/v1/teams \
   -u {USERNAME}:{PASSWORD} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "name": "My team"
   }'
```

> Example Response:

```json
{
    "id":"55083c567aea6f030000001a",
    "name":"My team",
    "members":["5508411b34e5ac0300000019"]
}
```

This endpoint creates new team for user

### HTTP Request

`POST https://api.elastic.io/v1/teams/`

Parameter| Required | Description
--------- | -----------| -----------
name      | no | team name

### Returns

Returns teams metadata object if the call succeeded.
