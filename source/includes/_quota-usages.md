# Quota Usages (Experimental)

 <aside class="warning">
 <b>The Quota Usages section is an experimental API</b>
 </aside>

## Retrieve a contract usage metrics by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}?period=2019-03 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "memory": 2245348201,
    "cpu": 768877946
  }
}
```

This endpoint allows you to retrieve a contract usage metrics by its ID. Memory usage is reported as a sum of RAM usage for each second during the specified period for each step. CPU usage is reported as an amount of consumed CPU for each step.

### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}?period={PERIOD}`

### URL Parameters

| Parameter   | Required | Description                                                                            |
| :---------- | :------- | :------------------------------------------------------------------------------------- |
| CONTRACT_ID | Yes      | Contract identifier                                                                    |
| PERIOD      | Yes      | Usage period. Allowed values: `week` (current week), `[yyyy]-[mm]` (month of the year) |

### Authorization

Only a corresponding contract member can be authorized to send this request.

### Returns

Memory (in [MiB](https://en.wikipedia.org/wiki/Mebibyte)) and CPU (in [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu)) usage for the given Contract ID

## Retrieve a workspace usage metrics by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}?period=2019-03 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "memory": 2245348201,
    "cpu": 768877946
  }
}
```

This endpoint allows you to retrieve the usage metrics for a workspace by its ID. Memory usage is reported as a sum of RAM usage for each second during the specified period for each step. CPU usage is reported as an amount of consumed CPU resource for each step.

### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}?period={PERIOD}`

### URL Parameters

| Parameter    | Required | Description                                                                            |
| :----------- | :------- | :------------------------------------------------------------------------------------- |
| WORKSPACE_ID | Yes      | Workspace identifier                                                                   |
| PERIOD       | Yes      | Usage period. Allowed values: `week` (current week), `[yyyy]-[mm]` (month of the year) |

### Authorization

Only a corresponding contract member can be authorized to send this request.

### Returns

Memory (in [MiB](https://en.wikipedia.org/wiki/Mebibyte)) and CPU (in [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu)) usage for the given Workspace ID
