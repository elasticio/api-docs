# Logs (Experimental)

 <aside class="warning">
 <b>The Logs section is an experimental API</b>
 </aside>


## Retrieve all Workspaсe logs

> Example Request:

```shell
curl {{ api_base_url }}/v2/logs?workspace_id={WORKSPACE_ID}&from=2020-01-12T14:50:42.215Z&to=2020-01-14T14:50:42.215Z \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "total":1,
  "hits":[
    {
      "flowId":"5d3848406af31c0015c2300c",
      "userId":"5bbf202b37f655001383e923",
      "componentId":"55bb6a58fa35a40c00000009",
      "stepId":"step_1",
      "execId":"31768cc6d3c64efbaf1a703392c468c1",
      "method":"timer",
      "apiUserName":"task-5d3848406af31c0015c2300c",
      "componentName":"Timer",
      "timestamp":"2020-01-13T10:35:42.049Z",
      "message":"Successfully downloaded and extracted slug file"
    }
  ]
}
```

This endpoint allows you to retrieve all logs from specified Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/logs?workspace_id={WORKSPACE_ID}`

### URL Parameters

| Parameter   | Required | Description                                             |
| :---------- | :------- | :------------------------------------------------------ |
| {WORKSPACE_ID} | Yes   | Workspace identifier                                 |
| FROM   | No      | Start Date of the period. Format – ISO 8601 |
| TO     | No      | End Date of the period. Format – ISO 8601   |
| SEARCH | No      | String to search in logs | 
| OFFSET | No      | Number of items to skip from the beginning |
| LIMIT  | No      | Number of items to return |   


### Authorization

This request is authorized for a user with the `workspaces.logs.read_all` permission.

### Returns

All logs from specified Workspace.

