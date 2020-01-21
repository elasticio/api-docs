# Logs (Experimental)

 <aside class="warning">
 <b>The Logs section is an experimental API</b>
 </aside>


## Retrieve all Workspaсe logs

> Example Request:

```shell
curl {{ api_base_url }}/v2/logs?workspace_id={WORKSPACE_ID}&from=2020-01-01T00:00:00.000Z&to=2021-12-31T23:59:59.999Z \
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
      "id":"4eae4f60-3c53-11ea-877e-42010a1c0003",
      "workspace_id": "5cf649c3449c1e001200c1ba"
      "flow_id":"5d3848406af31c0015c2300c",
      "user_id":"5bbf202b37f655001383e923",
      "component_id":"55bb6a58fa35a40c00000009",
      "container_id": "a6dd831f-2e1f-4a4b-818d-9cc5c156d766",
      "step_id":"step_1",
      "exec_id":"31768cc6d3c64efbaf1a703392c468c1",
      "method":"timer",
      "api_username":"task-5d3848406af31c0015c2300c",
      "component_name":"Timer",
      "timestamp":"2020-01-13T10:35:42.049Z",
      "message":"Successfully downloaded and extracted slug file"
    }
  ]
}
```

This endpoint allows you to retrieve all logs from specified Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/logs?workspace_id={WORKSPACE_ID}`

### URL Query Parameters

| Parameter     | Required | Description                                                                        |
| :------------ | :------- | :--------------------------------------------------------------------------------- |
| workspace_id  | Yes      | Workspace identifier                                                               |
| flow_ids[]    | No       | Flow identifier                                                                    |
| from          | No       | Start Date of the period. Format – ISO 8601. Example: `2020-01-12T14:50:42.215Z`   |
| to            | No       | End Date of the period. Format – ISO 8601. Example: `2020-01-14T15:00:45.000Z`     |
| search        | No       | String to search in logs (searching string is wrapped by <em> tag)                 |
| offset        | No       | Number of items to skip from the beginning (defaults to 0)                         |
| limit         | No       | Number of items to return (defaults to 100)                                        |


### Authorization

This request is authorized for a user with the `workspaces.logs.read_all` permission.

### Returns

All logs from specified Workspace.

