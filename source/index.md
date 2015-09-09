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
   -u {EMAIL}:{APIKEY}
````

# Users

## Retrieve your user

> Example Request:

```curl
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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

> Example Request (No callback):

```curl
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY} \
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

> Example Response (No callback):

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com",
  "company": "Doe & Partners",
  "api_secret":"7a00b1ec-a0a8-4cea-84d2-d26052c8b788"
}
```

> Example Request (With callback)

```curl
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "first_name": "John",
      "last_name": "Doe",
      "email": "test@example.com",
      "password": "secret",
      "company": "Doe & Partners",
      "callback_url": "http://my.awesome.callback/path"
   }'
```

> Example Response (With callback):

```http
HTTP/1.1 202 Accepted
Content-Type: application/json

{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com",
  "company": "Doe & Partners",
  "api_secret":"7a00b1ec-a0a8-4cea-84d2-d26052c8b788"
}
```

> Example Callback Request:

```curl
curl http://my.awesome.callback/path \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
  {
    "id": "54f4be3fe7d5224f91000001",
    "first_name": "John",
    "last_name": "Doe",
    "email": "test@example.com",
    "company": "Doe & Partners",
    "api_secret":"7a00b1ec-a0a8-4cea-84d2-d26052c8b788"
  }'
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
callback | no | Callback Url to call the result with

### Returns

#### No Callback Provided
A created user object.

New user objects will be provided with an ``id`` and ``api_secret`` fields - these values cannot be created or edited by clients.

The ``api_secret`` field is used to communicate with the API on user's behalf.

#### With Callback Provided

`{"message": "accepted"}`

When the user is created the provided ``callback_url`` will be called with the resulting user object.

New user objects will be provided with an ``id`` and ``api_secret`` fields - these values cannot be created or edited by clients.

The ``api_secret`` field is used to communicate with the API on user's behalf.


## Delete one of the created users

This method works with following limitations:

 - You can only delete users that you created 
 - You can not delete a user who's identity is provided via authentication for a call

> Example Request:

```curl
curl https://api.elastic.io/v1/users/123456789 \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "message" : "Successfully delete user id=123456789"
}
```

### HTTP Request

`DELETE https://api.elastic.io/v1/users/123456`

#### Returns

Returns an HTTP 200 in case of successful deletion


# Recipes

## Retrieve all Recipes

> Example Request:


```curl
curl https://api.elastic.io/v1/recipes/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
curl https://api.elastic.io/v1/recipes/shopware_to_mailchimp \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "accounts": {
          "accounts" : {
            "mailchimp" : {
              "name": "Optional name",
              "credentials" : {
                "apiKey": "2314123412341234-eu1"
              }
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

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "syncAppId": "55cdf472aebbe9650d000008",
  "syncAppTitle": "Shopware to Mailchimp",
  "tasks": [
    {
      "id": "55cdf472aebbe9650d000006",
      "name": "New Mailchimp subscriber"
    },
    {
      "id": "55cdf472aebbe9650d000007",
      "name": "Un-subscribe from Mailchimp"
    }
  ]
}
```

This endpoint creates tasks from a given recipe. You should supply necessary for recipe activation data such as:
 * Mandatory account information - in case you have multiple tasks you need multiple accounts for each unique component, for example you have two tasks first ```Webhook to Mailchimp``` and second ```Mailchimp to Shopware``` you need to specify accounts for ```Mailchimp``` and ```Shopware```
 * Optional configuration information - if we continue sample above to get the ```Mailchimp``` component running you need a mailchimp list ID where to store/export user's data (or any other required configuration), here you can supply the default configuration properties that will be set to all ```mailchimp``` steps by using following JSON:
   ```json
   "configuration" : {
    "mailchimp" : {
      "listId: "foo",
      "anything" : "else"
    }
   }
   ```

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "key": "ssh-rsa YOUR KEY GOES HERE,
       "title": "My Key"
   }'
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -X DELETE
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "components": [
    {
      "data": {
        "title": "Component title",
        "description": "Description",
        "icon": "<String>",
        "credentials": {
          "fields": {
            "name": {
              "viewClass": "TextFieldView",
              "required": true,
              "label": "Your name"
            }
          }
        },
        "triggers": {
          "select": "<Triggers Object>"
        },
        "actions": {
          "update": "<Actions Object>"
        }
      },
      "repo_id": "MONGO_ID"
    }
  ]
}
```

This endpoint retrieves list of user's components.
More details you can find [here](http://docs.elastic.io/docs/component-descriptor).

### HTTP Request

`GET https://api.elastic.io/v1/components/mine`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon in base64
triggers  | Object   | [&lt;Triggers Object&gt;](http://docs.elastic.io/docs/component-descriptor#triggers-object)
actions   | Object   | [&lt;Actions Object&gt;](http://docs.elastic.io/docs/component-descriptor#actions-object)

## Retrieve public components


> Example Request:


```curl
curl https://api.elastic.io/v1/components/public \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "components": [
    {
      "data": {
        "title": "Timer",
        "description": "Timer",
        "icon": "<String>",
        "fields": {
          "interval": {
            "label": "Interval",
            "model": {
              "day": "Every Day",
              "hour": "Every Hour",
              "minute": "Every Minute"
            },
            "prompt": "Please select an interval",
            "required": true,
            "viewClass": "SelectView"
          }
        },
        "triggers": {
          "timer": {
            "title": "Timer",
            "main": "./timer.js",
            "type": "polling",
            "metadata": {
              "out": {
                "properties": {
                  "fireTime": {
                    "format": "date-time",
                    "required": true,
                    "type": "string"
                  }
                },
                "type": "object"
              }
            }
          }
        }
      },
      "repo_id": "MONGO_ID"
    }
  ]
}
```

This endpoint retrieves list of public components
More details you can find [here](http://docs.elastic.io/docs/component-descriptor).

### HTTP Request

`GET https://api.elastic.io/v1/components/public`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon in base64
triggers  | Object   | [&lt;Triggers Object&gt;](http://docs.elastic.io/docs/component-descriptor#triggers-object)
actions   | Object   | [&lt;Actions Object&gt;](http://docs.elastic.io/docs/component-descriptor#actions-object)


#Repositories

## Get user's repositories

> Example Request:

```curl
curl https://api.elastic.io/v1/repos/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "name": "My Repo"
   }'
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -X DELETE \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{}
```

This endpoint delete repository

### HTTP Request

`DELETE https://api.elastic.io/v1/repos/{ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID        | yes      | repository id


## Get env vars

> Example Request:

```curl
curl https://api.elastic.io/v1/repos/{REPO_ID}/env/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "API_KEY": "key",
    "API_SECRET": "secret"
}
```

### HTTP Request

`GET https://api.elastic.io/v1/repos/{REPO_ID}/env/`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | Repository ID

### Returns

Returns environment variables of repository if the call succeeded.


## Modify env vars
Update env vars for repository. You can update existing env vars by setting them again, and remove by setting it to NULL.

> Example Request:

```curl
curl https://api.elastic.io/v1/repos/{REPO_ID}/env/ \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "API_KEY": "new_key",
       "API_SECRET": null
   }'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "API_KEY": "new_key"
}
```

### HTTP Request

`PUT https://api.elastic.io/v1/repos/{REPO_ID}/env/`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | Repository ID


### Returns

Returns updated environment variables of repository if the call succeeded.


#Tasks

## Start a Task

> Example Request:


```curl
curl -X POST https://api.elastic.io/v1/tasks/start/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

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
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "name": "My team"
   }'
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

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

#Accounts

## Get user's accounts


> Example Request:


```curl
curl https://api.elastic.io/v1/accounts/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id":"55083c567aea6f030000001a",
        "name":"My Dropbox account",
        "keys": {
            "oauth": {
                "key": "some key"
            }
        }
    }
]
```

This endpoint retrieves list of user's accounts

### HTTP Request

`GET https://api.elastic.io/v1/accounts/`


### Returns

Returns a list of accounts if the call succeeded.


## Get user's account


> Example Request:


```curl
curl https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "55083c567aea6f030000001a",
    "name": "My Dropbox account",
    "type": "dropbox",
    "keys": {
        "oauth": {
            "key": "some key"
        }
    }
}
```

This endpoint retrieves one of user's accounts

### HTTP Request

`GET https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
ACCOUNT_ID | The ID of the account 

### Returns

Returns an account object if the call succeeded.


## Modify user's account


> Example Request:


```curl
curl https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -X PUT \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
      {
          "name": "New account name"
      }'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "55083c567aea6f030000001a",
    "name": "New account name",
    "type": "dropbox",
    "keys": {
        "oauth": {
            "key": "some key"
        }
    }
}
```

This endpoint modifies user's account

### HTTP Request

`PUT https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
ACCOUNT_ID | The ID of the account

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
name | no | Account name
type | no | Account type (e.g. "dropbox")
keys | no | An object which represents component's configuration (OAuth keys, etc.)

### Returns

Returns a modified account object if the call succeeded.


#Component Execution

## Schedule a component execution


> Example Request:


```curl
 curl https://api.elastic.io/v1/exec/schedule \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "execution_type": "get_meta_model",
      "action_or_trigger": "put",
      "component": "{CONNECTOR_ID}",
      "account_id": "{ACCOUNT_ID}"
    }'
```

> Example Response:

```http
HTTP/1.1 202 Accepted
Content-Type: application/json
Location: 'https://api.elastic.io/v1/exec/poll/540492e623773659c5000002'

{
  "message": "ok"
}
```

Using this endpoint you can schedule a component execution.
It responds with the resource to poll on, in order to get the result of the scheduled execution.

### HTTP Request

`POST https://api.elastic.io/v1/exec/schedule`

Parameter| Required | Description | Used in  
--------- | -----------| ----------- | -----------
execution_type | yes | "get_meta_model", "select_model" or "verify_credentials" | all requests
component | yes | Specifies id of the connector to be executed | all requests
account_data | yes | Account data for validation | verify_credentials
action_or_trigger | yes | The name of action or trigger from connector | get_meta_model, select_model
account_id | yes | Account id | get_meta_model, select_model
model_method | yes | Name of the method from action or trigger to execute | select_model
cfg | no | Object with additional parameters | get_meta_model, select_model


### Returns

Responds with 202 Accepted and a 'Location' header.
The 'Location' header specifies a resource to poll on until the execution result is ready.

## Poll execution result status


> Example Request:


```curl
curl https://api.elastic.io/v1/exec/poll/{EXECUTION_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response (Result ready):

```http
HTTP/1.1 303 See Other
Content-Type: application/json
Location: 'https://api.elastic.io/v1/exec/result/540492e623773659c5000002'

{
  "message": "Ready."
}
```

> Example Response (In progress):

```http
HTTP/1.1 303 See Other
Content-Type: application/json

{
  "message": "Ready."
}
```

This endpoint provides information about the status of a scheduled component execution. Once the execution is done, the endpoint responds with status code 303 and provides a resource to query the result in the 'Location' header.

### HTTP Request

`GET https://api.elastic.io/v1/exec/poll/{EXECUTION_ID}`

Parameter| Required | Description
--------- | -----------| -----------
EXECUTION_ID | yes | The id of a previously scheduled execution

### Returns

Status Code| Body | Header |Description
--------- | -----------| ----------- | -----------
500 | `{message: 'Internal Server Error'}` | - | An error occured on the server
404 | `{message: 'Result does not exist.'}` | - | An attempt to poll for a non scheduled execution was made
404 | `{message: 'Expired.'}` | - | The execution has expired 
200 | `{message: 'Result not ready yet.'}` | - | The execution hasn't completed yet
303 | `{ message: "Ready." }` | Location | The execution is finished and the result is ready. Resource to get the result is found in the 'Location header'


## Get execution result


> Example Request:


```curl
curl https://api.elastic.io/v1/exec/result/{EXECUTION_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Location: 'https://api.elastic.io/v1/exec/result/540492e623773659c5000002'

{
  "data": {
    "some": "value"
  }
}
```

This endpoint exposes the component execution result(error) and is the final resource to call in the component execution flow in the API. 

### HTTP Request

`GET https://api.elastic.io/v1/exec/result/{EXECUTION_ID}`

Parameter| Required | Description
--------- | -----------| -----------
EXECUTION_ID | yes | The id of a previously scheduled execution

### Returns

Status Code| Body | Header |Description
--------- | ----------- | ----------- | -----------
500 | `{message: 'Internal Server Error'}` | - | An error occured on the server
404 | `{message: 'Result does not exist.'}` | - | An attempt to poll for a non scheduled execution was made
400 | `{message: 'Rejected.', reason: {...}}` | - | The execution has resulted in an error. The body of the response will contain the error object under the 'reason' property of the response. 
200 | `{ data: {...} }` | - | The json representation of the execution result can be found under the 'data' property of the response.
