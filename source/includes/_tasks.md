#Tasks

## Start a Task

> Example Request:


```shell
curl -X POST https://api.elastic.io/v1/tasks/start/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "5538bd9646208d02b3000005",
  "status":"active"
}
```

This endpoint starts a given integration task.

### HTTP Request

`POST https://api.elastic.io/v1/tasks/start/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to start


### Returns

Result of starting the task.

## Stop a Task


> Example Request:


```shell
curl -X POST https://api.elastic.io/v1/tasks/stop/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "5538bd9646208d02b3000005",
  "status":"inactive"
}
```

This endpoint stops a given integration task.

### HTTP Request

`POST https://api.elastic.io/v1/tasks/stop/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to stop


### Returns

Result of stopping the task.
