# Scheduled Executions

## Preamble

### What are scheduled executions?

In order to set up usage of some component in a certain `node` in certain `Flow`, some available configuration options
could not be described in advance, because they depend on the context in each case.

Let's consider an example when we have a component with a module, which allows retrieving a list of goods from some
e-commerce platform. In this case, we have few configuration parameters, which should be configured in order to use a
component in some flow, but all available options are different for different e-commerce installations.

The first such "dynamic" parameter is a category of a good. Each installation has its own set of goods categories.

Goods in different categories have different attributes set, so the structure of data in messages (metadata), produced
by the module is dependent on selected category. So metadata also should be retrieved for each case.

And finally, each client uses own credential in order to connect connector with the e-commerce platform installation.
Credential parameters have to be verified somehow before usage (at least in order to avoid confusing bugs while using
component).


In order to solve each of three problems above, there are so-called scheduled executions, which allow running special
methods of a component.These methods are:

- `selectModel` allows retrieving available options for certain parameter of configuration, when component/module is used in some node in some flow
- `getMetaModel` allows retrieving metadata for certain configuration of some node of some flow
- `verifyCredentials` allows verifying if a configuration of credential of a certain component is valid


Each of the methods is executed in the same environment as a module of a component while executing of flows.


### Scheduled execution workflow

A component execution is an asynchronous operation. Upon an client request an execution is scheduled
and needs to wait for the next available worker. Once a worker is available the component is executed
and the results are sent back to the client. Because the results of an execution cannot be created and
returned immediately the client needs to wait and poll for the results.


For more details about asynchronous REST please read [RESTful CookBook](http://restcookbook.com/Resources/asynchroneous-operations/)
and [A day in the life of - Asynchronous operations in REST](https://www.adayinthelifeof.nl/2011/06/02/asynchronous-operations-in-rest/).


The following diagram displays the process of component scheduling:

1. A method execution is scheduled by sending a request corresponding endpoint (see below). The API responds with ``202 Accepted``.
The resource in the ``Location`` HTTP header is the URL to poll for execution results.
2. The execution result is polled periodically by sending requests to the polling resource``exec/poll/{EXECUTION_ID}``.
The API responds with ``200 OK`` if the result is not available yet. Please see how to [poll execution results](#poll-a-result-of-an-execution).
3. Once the result is available the polling resource responds with ``303 See Other``. The resource in the ``Location``
HTTP header is the URL to get the results of the execution. Please see how to [poll execution results](#poll-a-result-of-an-execution).
4. The results are retrieved from ``exec/result/{EXECUTION_ID}``. Please see how to [retrieve execution results](#retrieve-execution-result).


![Scheduled Executions](../images/scheduled_executions.png)

## Verify credentials

> Example Request:

```shell
 curl https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/verify-credential \
 -u {EMAIL}:{APIKEY} \ 
 -X POST -H 'Content-Type: application/json' -d '
 {
     "data": {
         "type": "verify-credential",
         "attributes": {
             "fields": {
                 "apiKey" : "secret"
             }
         }
     }
 }'
```

> Example Response:

```http
HTTP/1.1 202 Accepted
Content-Type: application/json; charset=utf-8
Location: 'https://api.elastic.io/v2/exec/poll/58becb8259a65f18c5c60eb0'

{
    "data": {
        "type": "execution-result",
        "id": "58becb8259a65f18c5c60eb0",
        "attributes": {
            "result": {},
            "status": "Pending request, waiting other process"
        }
    }
}
```

This resource allows you to verify credentials. The verification credential is an asynchronous process because it is
accomplished by sending a request to an external API. The entire process is described [here](#preamble). This page
describes how to perform the 1st step of this process. Please also read details on
[polling execution results](#poll-a-result-of-an-execution) and [retrieving execution results](#retrieve-execution-result).

### HTTP Request

`POST https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/verify-credential`

#### Authorization

The component should be accessible to the client.

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | Yes | Name of a component's module. |
| GIT_REVISION | Yes | Revision of the component’s build. For available versions see [here](#retrieve-component-versions). For latest version use ``latest``. |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | Yes | A value must be ``verify-credential``. |
| attributes.fields | Yes | An object which represents the configuration of credential. The semantics are same as in [creating a credential](#create-a-credential).
| relationships.agent.data.id | No | ID of the agent |

## Retrieve component's metamodel

> Example Request:


```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/dynamic-metadata \
 -u {EMAIL}:{APIKEY} \
 -X POST -H 'Content-Type: application/json' -d '
 {
    "data": {
        "type": "dynamic-metadata",
        "attributes": {
            "module": "{MODULE}",
            "fields": {
                "some_field" : "value",
                "another_field" : "another_value"
            }
        },
        "relationships": {
            "credential": {
                "data": {
                    "id": "{CREDENTIAL_ID}",
                    "type": "credential"
                }
            }
        }
    }
 }'
```

```javascript
TBD
```


> Example Response:

```http
HTTP/1.1 202 Accepted
Content-Type: application/json; charset=utf-8
Location: 'https://api.elastic.io/v2/exec/poll/58becb8359a65f18c5c60ec4'

{
    "data": {
        "type": "execution-result",
        "id": "58becb8359a65f18c5c60ec4",
        "attributes": {
            "result": {},
            "status": "Pending request, waiting other process"
        }
    }
}
```

This resource allows you to retrieve component's metamodel. The retrieval of metamodel is an asynchronous process
because it is accomplished by sending a request to an external API. The entire process is described [here](#preamble).
This page describes how to perform the 1st step of this process. Please also read details on
[polling execution results](#poll-a-result-of-an-execution) and [retrieving execution results](#retrieve-execution-result).


### HTTP Request

`POST https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/dynamic-metadata`

#### Authorization

The component should be accessible to the client.


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | Yes | Name of a component's module. |
| GIT_REVISION | Yes | Revision of the component’s build. For available versions see [here](#retrieve-component-versions). For latest version use ``latest``. |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | Yes | A value must be ``dynamic-metadata``. |
| attributes.module | Yes | Name of the component's module as defined in ``component.json``. |
| attributes.fields | Yes | Contains values for component's fields. Semantics are same as defining fields for a node in a [flow graph](#create-a-flow).
| relationships.credential.data.id | No | If credentials are specified in the component's descriptor, [create a credential](#create-a-credential) first and use its id.
| relationships.credential.data.type | No | If credentials are specified in the component's descriptor, value ``credential`` must be used here.
| relationships.agent.data.id | No | ID of the agent |

## Retrieve component's select model

> Example Request:

```shell
 curl https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_HASH}/select-model\
 -u {EMAIL}:{APIKEY} \ 
 -X POST -H 'Content-Type: application/json' -d '
 {
    "data": {
        "type": "select-model",
        "attributes": {
            "module": "{MODULE}",
            "method": "{METHOD}",
            "fields": {
                "some_field" : "value",
                "another_field" : "another_value"
            }
        },
        "relationships": {
            "credential": {
                "data": {
                    "id": "{CREDENTIAL_ID}",
                    "type": "credential"
                }
            }
        }
    }
 }'
```

```javascript
TBD
```


> Example Response:

```http
HTTP/1.1 202 Accepted
Content-Type: application/json; charset=utf-8
Location: 'https://api.elastic.io/v2/exec/poll/58becb8059a65f18c5c60e41'

{
    "data": {
        "type": "execution-result",
        "id": "58becb8059a65f18c5c60e41",
        "attributes": {
            "result": {},
            "status": "Pending request, waiting other process"
        }
    }
}
```


This resource allows you to retrieve component's select model. The retrieval of select model is an asynchronous process because it is
accomplished by sending a request to an external API. The entire process is described [here](#preamble). This page
describes how to perform the 1st step of this process. Please also read details on
[polling execution results](#poll-a-result-of-an-execution) and [retrieving execution results](#retrieve-execution-result).


### HTTP Request

`POST https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_HASH}/select-model`

#### Authorization

The component should be accessible to the client.

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Name of a component's module. |
| GIT_REVISION | Yes | Revision of the component’s build. For available versions see [here](#retrieve-component-versions). For latest version use ``latest``. |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | Yes | A value must be ``select-model`` |
| attributes.module | Yes | Name of the component's module as defined in ``component.json``. |
| attributes.method | Yes | Name of the method, which returns select model data. |
| attributes.fields | Yes | Contains values for component's fields. Semantics are same as defining fields for a node in a [flow graph](#create-a-flow).
| relationships.credential.data.id | No | If credentials are specified in the component's descriptor, [create a credential](#create-a-credential) first and use its id.
| relationships.credential.data.type | No | If credentials are specified in the component's descriptor, value ``credential`` must be used here.
| relationships.agent.data.id | No | ID of the agent |









## Poll a result of an execution


> Example Request:


```shell
curl https://api.elastic.io/v2/exec/poll/{EXECUTION_ID} \
 -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```


> Response "In progress":

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "type": "execution-result",
        "id": "58becb8059a65f18c5c60e41",
        "attributes": {
            "result": {},
            "status": "Pending request, waiting other process"
        },
        "links": {
            "self": "/v2/exec/result/58becb8059a65f18c5c60e41"
        }
    },
    "meta": {}
}
```

> Response "Result ready":

```http
HTTP/1.1 303 See Other
Content-Type: application/json
Location: /v2/exec/result/58becb8059a65f18c5c60e41

{
    "data": {},
    "meta": {}
}
```


This resource allows you to poll a result of an execution. Once the execution is done, the endpoint responds with
``HTTP 303`` and provides a resource for querying the result in the ``Location`` header.


### HTTP Request

`GET https://api.elastic.io/v2/exec/poll/{EXECUTION_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Name of a component's module. |
| GIT_REVISION | Yes | Revision of the component’s build. For available versions see [here](#retrieve-component-versions). For latest version use ``latest``. |


### Response status codes

| Status Code | Header   | Description |
| :--- | :--- | :--- |
| 200 | -        | The execution is still in progress.
| 303 | Location | The execution is finished and the result is ready. Resource to get the result is found in the ``Location`` header.
| 500 | -        | Internal server error
| 404 | -        | The execution does not exist (e.g. an attempt to poll for a non scheduled execution was made)



## Retrieve execution result


> Example Request:


```shell
curl https://api.elastic.io/v2/exec/result/{EXECUTION_ID}  \
 -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```

> Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "type": "execution-result",
        "id": "58becb8059a65f18c5c60e41",
        "attributes": {
            "result": {
                "data": {
                    "some_field_of_result": "value",
                    "another_field": "another_value"
                }
            }
        }
    }
}
```


### HTTP Request

`GET https://api.elastic.io/v2/exec/result/{EXECUTION_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| EXECUTION_ID | yes | Execution identifier. |

### Response status codes

| Status Code | Description |
| :--- | :--- |
| 200 | The execution result is ready.
| 409 | The execution result is not ready yet.

### Returns

This endpoint returns a result of the execution. When execution is in progress and result is not ready yet, HTTP status code 409 is returned.
