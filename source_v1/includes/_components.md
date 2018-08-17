# Components

## Retrieve private components


> Example Request:


```shell
curl {{ api_base_url }}/v1/components/mine \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
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
More details you can find [here]({{ docs_url }}/component-descriptor).

### HTTP Request

`GET {{ api_base_url }}/v1/components/mine`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon in base64
triggers  | Object   | [&lt;Triggers Object&gt;]({{ docs_url }}/component-descriptor#triggers-object)
actions   | Object   | [&lt;Actions Object&gt;]({{ docs_url }}/component-descriptor#actions-object)

## Retrieve public components


> Example Request:


```shell
curl {{ api_base_url }}/v1/components/public \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


```javascript
var client = require('{{ repo_name }}-rest-node')(
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
More details you can find [here]({{ docs_url }}/component-descriptor).

### HTTP Request

`GET {{ api_base_url }}/v1/components/public`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon in base64
triggers  | Object   | [&lt;Triggers Object&gt;]({{ docs_url }}/component-descriptor#triggers-object)
actions   | Object   | [&lt;Actions Object&gt;]({{ docs_url }}/component-descriptor#actions-object)


## Retrieve an single component descriptor


> Example Request:


```shell
curl {{ api_base_url }}/v1/components/{COMPONENT_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.components.retrieve({COMPONENT_ID})
    .then(function(components) {
        // do something with components
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "repo_id": "55828f5a630d500800000003",
  "data": {
    "title": "mock component",
    "description": "mock",
    "credentials": {
      "fields": {
        "name": {
          "label": "Your name",
          "required": true,
          "viewClass": "TextFieldView"
        }
      }
    },
    "triggers": {
      "getHello": {
        "main": "./lib/triggers/getHello.js",
        "type": "polling",
        "title": "Query Hello",
        "metadata": {
          "out": {
            "type": "object",
            "properties": {
              "message": {
                "type": "string",
                "required": false,
                "title": "Hello string"
              }
            }
          }
        }
      }
    },
    "actions": {
      "updateHello": {
        "main": "./lib/actions/updateHello.js",
        "title": "Update Hello",
        "fields": {
          "dynamicSelect": {
            "viewClass": "SelectView",
            "prompt": "Select your value",
            "label": "Value",
            "required": false,
            "model": "getModel"
          }
        },
        "dynamicMetadata": true
      }
    },
    "language": "nodejs",
    "sailor_version": "0.0.4",
    "icon": "iVBORw0KGgoAAAANSUhEAAASUVORK5CYII="
  },
  "name": "mock-component",
  "team": "{{ repo_name }}"
}
```

This endpoint retrieves an information about single component by it's ID
More details you can find [here]({{ docs_url }}/component-descriptor).

### HTTP Request

`GET {{ api_base_url }}/v1/components/{COMPONENT_ID}`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
repo_id   | String   | ID of the component 
data      | Object   | A component descriptor, see [&lt;here&gt;]({{ docs_url }}/component-descriptor)
name      | String   | A name of the component repository
team      | String   | A name of the component repository team
