# Components

## Retrieve private components


> Example Request:


```shell
curl https://api.elastic.io/v1/components/mine \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.components.mine()
    .then(function(components) {
        // do something with components
    });
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


```shell
curl https://api.elastic.io/v1/components/public \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.components.public()
    .then(function(components) {
        // do something with components
    });
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
