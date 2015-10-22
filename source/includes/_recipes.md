# Recipes

## Retrieve all Recipes

> Example Request:


```shell
curl https://api.elastic.io/v1/recipes/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.recipes.list()
    .then(function(recipes) {
        // do something with the recipes
    });
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


```shell
curl https://api.elastic.io/v1/recipes/{RECIPE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.recipes.retrieve({RECIPE_ID})
    .then(function(recipe) {
        // do something with the recipe
    });
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

```shell
curl https://api.elastic.io/v1/recipes/shopware_to_mailchimp \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
        "accounts" : {
            "mailchimp" : {
                "name": "Account for plugin",
                "credentials" : {
                    "apiKey": "123456789-eu1"
                }
            }
        },
        "configuration" : {
            "mailchimp" : {
                "listId" : "112233"
            }
        }
    }'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.recipes.activate("shopware_to_mailchimp", {
    "accounts" : {
        "mailchimp" : {
            "name": "Account for plugin",
            "credentials" : {
                "apiKey": "123456789-eu1"
            }
        }
    },
    "configuration" : {
        "mailchimp" : {
            "listId" : "112233"
        }
    }
}).then(function(result) {

    // do something with the result
});
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
configuration | A hash of key/value pairs representing fields used to configure connectors. The keys are the ids of connectors and the values are values of fields.
