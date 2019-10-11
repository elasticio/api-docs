# Snapshots
This group of api endpoints gives you possibility to work with `snapshots` feature of platform. It gives possibility to get snapshots for all steps in flow. It also gives possibility to get/create/edit/remove snapshots individually for steps.

Data model: every step in flow is able to have associated persistent data. Step identifier is used as identifier of snapshot. Data may be anything serializable in json except undefined.


## Retrieve snapshots for all steps in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows{FLOW_ID}/snapshots \
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
            "id": "{STEP_ID}",
                "type": "snapshot",
                "links":{
                    "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
                },
                "attributes":{
                    "snapshot": "{BODY OF SNAPSHOT}"
                }
        },
        {
            "id":"{STEP_ID}",
            "type": "snapshot",
            "links":{
                "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
            },
            "attributes":{
                "snapshot": "{BODY OF SNAPSHOT}"
            }
        },
        {
            "id":"{STEP_ID}",
            "type": "snapshot",
            "links":{
                "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
            },
            "attributes":{
                "snapshot": "{BODY OF SNAPSHOT}"
            }
        }
    ],
    "meta":{}
}
```

This resource allows you to retrieve snapshots for all steps in flow

## Retrieve snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows{FLOW_ID}/snapshots/{STEP_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "id":"{STEP_ID}",
        "type":"agent",
        "links":{
            "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
        },
        "attributes":{
            "snapshot": "{BODY OF SNAPSHOT}"
        }
    },
    "meta":{}
}
```

This resource allows you to retrieve snapshot for one step in flow

## Edit snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/agents \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
        "data":{
            "type": "snapshot",
            "id": "{STEP_ID}"
            "attributes": {
                "snapshot": "{BODY OF SNAPSHOT}"
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
            "snapshot": "{BODY_OF_SNAPSHOT}"
        }
    },
    "meta":{}
}
```

This resource allows you to edit snapshot for step in flow.

##### Notices
1. It's forbidden to edit snapshot for step, that does not exist in flow.
2. It's forbidden to edit snapshot for step, if no snapshot exists.


## Create snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/agents \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
        "data":{
            "type": "snapshot",
            "id": "{STEP_ID}"
            "attributes": {
                "snapshot": "{BODY OF SNAPSHOT}"
            }
        }
    }'
```



> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
    "data":{
        "id":"{STEP_ID}",
        "type":"snapshot",
        "links":{
            "self":"/v2/flows/{FLOW_ID}/snapshots/{STEP_ID}"
        },
        "attributes":{
            "snapshot": "{BODY_OF_SNAPSHOT}"
        }
    },
    "meta":{}
}
```

This resource allows you to create snapshot for step in flow.

##### Notices
1. It's forbidden to create snapshot for step, that does not exist in flow.
2. It's forbidden to create snapshot for step, if snapshot already exists.


## Remove snapshot for one step in flow
> Example Request:


```shell
curl {{ api_base_url }}/v2/flows{FLOW_ID}/snapshots/{STEP_ID} \
    -X DELETE
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 204 OK
Content-Type: application/json

{
}
```

This resource allows you to remove snapshot for step in flow.
