# Stats

## Retrieve the Amount of Messages in Input Queues of All Steps in the Flow

> Example Request:

```shell
curl {{ api_base_url }}/v2/stats/queues/{FLOW_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
 "data": {
    "id": "{FLOW_ID}",
    "type": "flow-queue-stats",
    "attributes": {
      "stats": [
        {
          "step_id": "step_1",
          "total": 10,
          "ready": 8,
          "unacked": 2,
          "rebounds": 10
        },
        {
          "step_id": "step_2",
          "total": 20,
          "ready": 20,
          "unacked": 0,
          "rebounds": 0
        }
      ]
    }
  }
}
```

This endpoint allows you to retrieve the amount of messages in input queues of all steps in the flow.

### HTTP Request

`GET {{ api_base_url }}/v2/stats/queues/{FLOW_ID}`

### URL Parameters

| Parameter | Required | Description
| :---      | :---     | :---
| FLOW_ID   | Yes      | Flow ID

### Authorization

This request is authorized for any member of the given Workspace.

### Returns

Amount of messages in input queues of all steps in the Flow.


## Retrieve the Information about Workspaces their Flows and Flow Components

> Example Request:

```shell
curl {{ api_base_url }}/v2/stats/workspaces \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "59d341e9037f7200184a408b",
      "type": "workspace-stats",
      "attributes": {
        "name": "Workspace 1",
        "type": "full",
        "flows": [
          {
            "id": "5ffdd11eefd48e0011ef803c",
            "name": "Flow 1",
            "status": "active",
            "type": "ordinary",
            "created_at": "2021-01-12T16:41:02.135Z",
            "updated_at": "2021-01-13T16:33:38.449Z",
            "components": [
              {
                "name": "webhook",
                "component_id": "55ba18e35d04040500000004",
                "version": "a5d0aff266698ecb61bee7e9416b2d3db4d1a20d"
              },
              {
                "name": "code",
                "component_id": "563a141fafbbef0700000003",
                "version": "latest"
              },
              {
                "name": "request-reply",
                "component_id": "5707a7f14888d9070000006a",
                "version": "f7a467a292c0996ec39423169989689de5b428a1"
              }
            ]
          }
        ]
      }
    },
    {
      "id": "5b86a38d63295500109a24b7",
      "type": "workspace-stats",
      "attributes": {
        "name": "Workspace 2",
        "type": "full",
        "flows": []
      }
    }
  ],
  "meta": {},
  "links": {
    "self": "/v2/stats/workspaces"
  }
}
```

This endpoint allows you to retrieve an information in form of the list of workspaces with flows in them and flow components.

### HTTP Request

`GET {{ api_base_url }}/v2/stats/workspaces`

### Query Parameters

| Parameter   | Required                                         | Description |
| :---        | :---                                             | :---        |
| contract_id | yes, for contract user<br />no, for tenant admin | Contract ID |

### Authorization

A client has to be a member of the Contract’s scope with the `global.stats.workspaces` permission or belong to the Tenant Admin users group (please contact our support department to get this specific role).

### Returns

List of workspaces with related information.
