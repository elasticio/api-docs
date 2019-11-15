# Snapshots
This group of API endpoints allows you to work with snapshots feature of the Platform. The feature enables taking snapshots for all steps in a Flow. Also, it allows you to get/create/edit/remove snapshots individually for steps.

Data model: every step in Flow can have associated persistent data. Step identifier is used as identifier of snapshot. Data may be anything serializable in JSON, except undefined.

**Notice:** `snapshot` is flow's runtime data. So it's forbidden to edit snapshots while flow is running.


## Retrieve snapshots for all steps in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":[
    {
      "id":"{STEP_ID}",
      "type":"snapshot",
      "links":{
        "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
      },
      "attributes":{
        "snapshot":"{BODY OF SNAPSHOT}"
      }
    },
    {
      "id":"{STEP_ID}",
      "type":"snapshot",
      "links":{
        "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
      },
      "attributes":{
        "snapshot":"{BODY OF SNAPSHOT}"
      }
    },
    {
      "id":"{STEP_ID}",
      "type":"snapshot",
      "links":{
        "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
      },
      "attributes":{
        "snapshot":"{BODY OF SNAPSHOT}"
      }
    }
  ],
  "meta":{}
}
```

This resource allows you to retrieve snapshots for all steps in flow

### HTTP Request

`GET {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots`

### Authorization

The client has to be a member of the Workspace's scope, where the specified Flow is located

### URL Parameters
Parameter       | Description
--------------- | -----------
FLOW_ID | The ID of the Flow

## Retrieve snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"{STEP_ID}",
    "type":"snapshot",
    "links":{
      "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
    },
    "attributes":{
      "snapshot":"{BODY OF SNAPSHOT}"
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve snapshot for one step in flow


### HTTP Request

`GET {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}`

#### Authorization

The client has to be a member of the Workspace's scope, where the specified Flow is located

### URL Parameters
Parameter       | Description
--------------- | -----------
FLOW_ID | The ID of the Flow
STEP_ID | ID of the Step from the specified Flow



## Edit snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"snapshot",
       "id":"{STEP_ID}",
       "attributes":{
         "snapshot":"{BODY OF SNAPSHOT}"
       }
     }
   }'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"{STEP_ID}",
    "type":"snapshot",
    "links":{
      "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
    },
    "attributes":{
      "snapshot":"{BODY_OF_SNAPSHOT}"
    }
  },
  "meta":{}
}
```

This resource allows you to edit snapshot for step in flow.

### HTTP Request

`PATCH {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}`

#### Authorization

This request is authorized to a user with the `workspaces.flow.edit` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
FLOW_ID | The ID of the Flow
STEP_ID | ID of the Step from the specified Flow


##### Notices
1. It's forbidden to edit snapshot for step, that does not exist in flow.
2. It's forbidden to edit snapshot for step, if no snapshot exists.


## Create snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/ \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"snapshot",
       "id":"{STEP_ID}",
       "attributes":{
         "snapshot":"{BODY OF SNAPSHOT}"
       }
     }
   }'
```



> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data":{
    "id":"{STEP_ID}",
    "type":"snapshot",
    "links":{
      "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
    },
    "attributes":{
      "snapshot":"{BODY_OF_SNAPSHOT}"
    }
  },
  "meta":{}
```

This resource allows you to create snapshot for step in flow.

### HTTP Request

`POST {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/`

#### Authorization

This request is authorized to a user with the `workspaces.flow.edit` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
FLOW_ID | The ID of the Flow

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id          | yes       | ID of the Step from the specified Flow (the same as in URL)
attributes.snapshot | yes       | The body of the snapsot. The value may be anything except `undefined`


##### Notices
1. It's forbidden to create snapshot for step, that does not exist in flow.
2. It's forbidden to create snapshot for step, if snapshot already exists.


## Remove snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID} \
    -X DELETE
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to remove a step snapshot in a Flow.

### HTTP Request

`DELETE {{ api_base_url }}/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}`

#### Authorization

This request is authorized to a user with the `workspaces.flow.edit` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
FLOW_ID | The ID of the Flow
STEP_ID | ID of the Step from the specified Flow
