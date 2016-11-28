#Tasks

## Create task


> Example Request:


```shell
 curl https://api.elastic.io/v1/tasks \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
        "name" : "WebHook to Mailchimp",
        "nodes" : [
            {
                "function" : "elasticio/webhook:receive",
                "config": {
                    "payload": "email,first,last"
                }
            },
            {
                "function" : "elasticio/mapper:map",
                "config": {
                    "mapper" : {
                        "lastName" : "{{last}}",
                        "firstName" : "{{first}}",
                        "salutation" : "{{salutation}}",
                        "email_type" : "html",
                        "email" : "{{email}}"
                    },
                    "lookup_tables": {
                        "salutation": "lookup-table-id-to-be-used-for-salutation"
                    }
               }
            },
            {
                "function" : "elsaticio/mailchimp:subscribe",
                "account" : "54536902230d250700000016",
                "config": {
                    "listId" : "8779dd762e"
               }
            }
        ]
    }'
```


```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.tasks.create({
    "name" : "WebHook to Mailchimp",
    "nodes" : [
        {
            "function" : "elasticio/webhook:receive",
            "config": {
                "payload": "email,first,last"
            }
        },
        {
            "function" : "elasticio/mapper:map",
            "config": {
                "mapper" : {
                    "lastName" : "{{last}}",
                    "firstName" : "{{first}}",
                    "salutation" : "{{salutation}}",
                    "email_type" : "html",
                    "email" : "{{email}}"
                },
                "lookup_tables": {
                    "salutation": "lookup-table-id-to-be-used-for-salutation"
                }
           }
        },
        {
            "function" : "elsaticio/mailchimp:subscribe",
            "account" : "54536902230d250700000016",
            "config": {
                "listId" : "8779dd762e"
           }
        }
    ]
})
.then(function(task) {
    // do something with the task
});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id":"55083c567aea6f030000001a"
}
```

This endpoint creates a new task for user

### HTTP Request

`POST https://api.elastic.io/v1/tasks/`

Parameter| Required | Description
--------- | -----------| -----------
name      | yes | task name
nodes      | yes | task nodes
cron      | no | cron expression defining task's scheduling period

### Returns

Returns tasks id object if the call succeeded.

## Start a Task

> Example Request:


```shell
curl -X POST https://api.elastic.io/v1/tasks/start/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.tasks.start({TASK_ID});
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

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.tasks.stop({TASK_ID});
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

## Delete a Task

> Example Request:


```shell
curl -X DELETE https://api.elastic.io/v1/tasks/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.tasks.delete({TASK_ID});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "5538bd9646208d02b3000005",
  "status":"deleted"
}
```

This endpoint deleted a given integration task.

### HTTP Request

`DELETE https://api.elastic.io/v1/tasks/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to delete


### Returns

Result of task deletion: task id and its new status ("deleted")
