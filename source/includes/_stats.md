# Stats

## Retrieve the Amount of Messages in Input Queues of All Steps in the Flow

> Example Request:

```shell
curl {{ api_base_url }}/v2/stats/queues/${FLOW_ID} \
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
          "total": 10
        },
        {
          "step_id": "step_2",
          "total": 20
        }
      ]
    }
  }
}
```

This endpoint allows you to retrieve the amount of messages in input queues of all steps in the flow.

### HTTP Request

`GET {{ api_base_url }}/v2/stats/queues/${FLOW_ID}`

### URL Parameters

| Parameter | Required | Description        
| :---      | :---     | :---               
| FLOW_ID   | Yes      | Flow ID  
  
### Authorization

This request is authorized for any member of the given Workspace.

### Returns

Amount of messages in input queues of all steps in the Flow.

