#Scheduled Executions

A component execution is an asynchronous operation. Upon an client request an execution is scheduled
and needs to wait for the next available worker. Once a worker is available the component is executed
and the results are sent back to the client. Because the results of an execution cannot be created and
returned immediately the client needs to wait and poll for the results.

For more details about asynchronous REST please read [RESTful CookBook](http://restcookbook.com/Resources/asynchroneous-operations/)
and [A day in the life of - Asynchronous operations in REST](https://www.adayinthelifeof.nl/2011/06/02/asynchronous-operations-in-rest/).

The following diagram displays the process of component scheduling:

1. A component execution is scheduled by sending a request to ``exec/schedule``. The API responds with ``202 Accepted``. The resource in the ``Location`` HTTP header is the url to poll for execution results.
2. The execution results are polled periodically by sending requests to the polling resource``exec/poll/{EXECUTION_ID}``. The API responds with ``200 OK`` if the result is not available yet.
3. Once the result is available the polling resource responds with ``303 See Other``. The resource in the ``Location`` HTTP header is the url to get the results from.
4. The results are retrieved from ``exec/result/{EXECUTION_ID}``. Please note that the result may be retrieved only once.

![Component execution](images/exec_sequence_diagram.png "Component execution")


## Schedule a component execution


> Example Request:


```shell
 curl https://api.elastic.io/v1/exec/schedule \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "execution_type": "get_meta_model",
      "action_or_trigger": "put",
      "component": "{CONNECTOR_ID}",
      "account_id": "{ACCOUNT_ID}"
    }'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.exec.schedule({
    "execution_type": "get_meta_model",
    "action_or_trigger": "put",
    "component": "{CONNECTOR_ID}",
    "account_id": "{ACCOUNT_ID}"
}).then(function(result) {

    // location contains the url to poll for results
    var location = result.location;
});
```

> Example Response:

```http
HTTP/1.1 202 Accepted
Content-Type: application/json
Location: 'https://api.elastic.io/v1/exec/poll/540492e623773659c5000002'

{
  "message": "ok"
}
```

Using this endpoint you can schedule a component execution.
It responds with the resource to poll on, in order to get the result of the scheduled execution.

### HTTP Request

`POST https://api.elastic.io/v1/exec/schedule`

Parameter| Required | Description | Used in
--------- | -----------| ----------- | -----------
execution_type | yes | "get_meta_model", "select_model" or "verify_credentials" | all requests
component | yes | Specifies id of the connector to be executed | all requests
account_data | yes | Account data for validation | verify_credentials
action_or_trigger | yes | The name of action or trigger from connector | get_meta_model, select_model
account_id | yes | Account id | get_meta_model, select_model
model_method | yes | Name of the method from action or trigger to execute | select_model
cfg | no | Object with additional parameters | get_meta_model, select_model


### Returns

Responds with 202 Accepted and a 'Location' header.
The 'Location' header specifies a resource to poll on until the execution result is ready.

## Poll execution result status


> Example Request:


```shell
curl https://api.elastic.io/v1/exec/poll/{EXECUTION_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.exec.pollResult({EXECUTION_ID})
    .then(function(response) {
        if (response.ready) {
            // do something with the result
            var result = response.result;
       } else {
            // poll again
       }
    });
```


> Response "In progress":

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "message": "Result is not ready yet"
}
```

> Response "Result ready":

```http
HTTP/1.1 303 See Other
Content-Type: application/json
Location: 'https://api.elastic.io/v1/exec/result/540492e623773659c5000002'

{
  "message": "Ready."
}
```

This endpoint provides information about the status of a scheduled component execution. Once the execution is done, the endpoint responds with status code 303 and provides a resource to query the result in the 'Location' header.

### HTTP Request

`GET https://api.elastic.io/v1/exec/poll/{EXECUTION_ID}`

Parameter| Required | Description
--------- | -----------| -----------
EXECUTION_ID | yes | The id of a previously scheduled execution

### Returns

Status Code| Body | Header |Description
--------- | -----------| ----------- | -----------
500 | `{message: 'Internal Server Error'}` | - | An error occured on the server
404 | `{message: 'Result does not exist.'}` | - | An attempt to poll for a non scheduled execution was made
404 | `{message: 'Expired.'}` | - | The execution has expired
200 | `{message: 'Result not ready yet.'}` | - | The execution hasn't completed yet
303 | `{ message: "Ready." }` | Location | The execution is finished and the result is ready. Resource to get the result is found in the 'Location header'


## Get execution result


> Example Request:


```shell
curl https://api.elastic.io/v1/exec/result/{EXECUTION_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
// As client.exec.pollResult will follow the HTTP 3003 redirect,
// Node.js client does not provide extra functionality to retrieve the results.
// Read the docs of client.exec.pollResult above.
```

> Response "Result available"

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "some": "value"
  }
}
```

> Response "Result not found"

```http
HTTP/1.1 404 Not found
Content-Type: application/json

{
  "message": "Result does not exist"
}
```

This endpoint exposes the component execution result(error) and is the final resource to call in the component execution flow in the API.

### HTTP Request

`GET https://api.elastic.io/v1/exec/result/{EXECUTION_ID}`

Parameter| Required | Description
--------- | -----------| -----------
EXECUTION_ID | yes | The id of a previously scheduled execution

### Returns

Status Code| Body | Header |Description
--------- | ----------- | ----------- | -----------
500 | `{message: 'Internal Server Error'}` | - | An error occurred on the server
404 | `{message: 'Result does not exist.'}` | - | An attempt to poll for a non scheduled execution was made
400 | `{message: 'Rejected.', reason: {...}}` | - | The execution has resulted in an error. The body of the response will contain the error object under the 'reason' property of the response.
200 | `{ data: {...} }` | - | The json representation of the execution result can be found under the 'data' property of the response.
