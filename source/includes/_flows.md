# Flows

## Retrieve all flows


> Example Request:


```shell
 curl https://api.elastic.io/v2/flows?page[size]=20&page[number]=1 \
   -g \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": [
        {
            "type": "flow",
            "id": "585918da586224001b96de89",
            "attributes": {
              "name": "Timer to E-Mail Test",
              "status": "inactive",
              "type": "ordinary",
              "graph": {
                "nodes": [
                  {
                    "id": "step_1",
                    "command": "elasticio/timer:timer",
                    "fields": {
                      "interval": "minute"
                    }
                  },
                  {
                    "id": "step_2",
                    "command": "elasticio/email:send"
                  }
                ],
                "edges": [
                  {
                    "source": "step_1",
                    "target": "step_2",
                    "config": {
                      "mapper": {
                        "to": "info@acme.org",
                        "subject": "Test",
                        "textBody": "{{fireTime}}"
                      }
                    }
                  }
                ]
              }
            },
            "relationships": {
              "user": {
                "data": {
                  "type": "user",
                  "id": "560e5a27734d480a00000002"
                },
                "links": {
                  "self": "/v2/users/560e5a27734d480a00000002"
                }
              },
              "organization": {
                "data": {
                  "type": "organization",
                  "id": "573dd76962436c349f000003"
                },
                "links": {
                  "self": "/v2/organizations/573dd76962436c349f000003"
                }
              }
            }
        }
    ],
    "meta": {
        "page": 1,
        "per_page": 20,
        "total": 1,
        "total_pages": 1
    }

}
```

This resource allows you to retrieve flows.

### HTTP Request

`GET https://api.elastic.io/v2/flows/`

### Query Parameters

| Parameter | Required | Description | Default |
| :--- | :--- | :--- | :--- |
| page\[size\] | No | Amount of items per page | 50 |
| page\[number\] | No | Number of page | 1 |

### Returns

Returns all flows belonging to the given user. If the user is a member of an organization,
all the flows of the organization are returned. If the user is a member in multiple organizations, the given API key is
used to match the proper organization.

## Retrieve a flow by ID

> Example Request:


```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -u {EMAIL}:{APIKEY}
```

```javascript
TDB
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "type": "flow",
    "id": "585918da586224001b96de89",
    "attributes": {
      "name": "Timer to E-Mail Test",
      "status": "inactive",
      "type": "ordinary",
      "graph": {
        "nodes": [
          {
            "id": "step_1",
            "command": "elasticio/timer:timer",
            "fields": {
              "interval": "minute"
            }
          },
          {
            "id": "step_2",
            "command": "elasticio/email:send"
          }
        ],
        "edges": [
          {
            "source": "step_1",
            "target": "step_2",
            "config": {
              "mapper": {
                "to": "info@acme.org",
                "subject": "Test",
                "textBody": "{{fireTime}}"
              }
            }
          }
        ]
      }
    },
    "relationships": {
      "user": {
        "data": {
          "type": "user",
          "id": "560e5a27734d480a00000002"
        },
        "links": {
          "self": "/v2/users/560e5a27734d480a00000002"
        }
      },
      "organization": {
        "data": {
          "type": "organization",
          "id": "573dd76962436c349f000003"
        },
        "links": {
          "self": "/v2/organizations/573dd76962436c349f000003"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to retrieve a flow by its identifier. If the flow with given ID does not belong to the current
user or to one of his organizations, an error is returned.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |


### Returns

The flow with given ID

## Retrieve all flow versions by its ID

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions?page[size]=20&page[number]=1 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": [
      {
         "id": "585918da586224001b96de88",
         "type": "flow-version",
         "attributes": {
            "version": "c77c09a2b5f9e528c6de443ea5cce5fca4fb8c10",
            "latest": true,
            "created_at": "2017-11-27T16:22:07.339Z",
            "name": "WebHook to Mailchimp",
            "cron": "*/3 * * * *",
            "graph": {
               "nodes": [
                  {
                     "first": true,
                     "id": "step_1",
                     "function": "receive"
                  },
                  {
                     "id": "step_2",
                     "function": "map"
                  },
                  {
                     "id": "step_3",
                     "function": "subscribe"
                  }
               ],
               "connections": [
                  {
                     "to": "step_2",
                     "from": "step_1"
                  },
                  {
                     "to": "step_3",
                     "from": "step_2"
                  }
               ]
            },
            "data": {
               "step_1": {
                  "payload": "email,first,last"
               },
               "step_2": {
                  "mapper": {
                     "lastName": "{{last}}",
                     "firstName": "{{first}}",
                     "email_type": "html",
                     "email": "{{email}}"
                  },
                  "lookupTables": {
                     "salutation": "lookup-table-id-to-be-used-for-salutation",
                     "create_new_lookup1": "new-lookup-id",
                     "create_new_lookup2": "new-lookup-id"
                  }
               },
               "step_3": {
                  "listId": "8779dd762e"
               }
            }
         },
         "links": {
            "self": "/v2/flows/585918da586224001b96de89/versions/c77c09a2b5f9e528c6de443ea5cce5fca4fb8c10"
         },
         "relationships": {
            "user": {
                "data": {
                    "id": "585918da586224001b96de89",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/585918da586224001b96de89"
                }
            },
            "flow": {
               "data": {
                  "id": "585918da586224001b96de89",
                  "type": "flow"
               },
               "links": {
                  "self": "/v2/flows/585918da586224001b96de89"
               }
            }
         }
      }
   ],
   "meta": {
      "page": 1,
      "per_page": 20,
      "total": 1,
      "total_pages": 1
   }
}
```

This resource allows to you retrieve available versions for your flow.
These versions are indicate the history of changes for the flow.

Each version resource consists of changed flow ID, who is the author of the change (its user ID), version hash and all other fields that was changed.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions`

### URL Parameters

| Parameter      | Required | Description              | Default |
| :------------- | :------- | :----------------------- | :------ |
| FLOW_ID        | Yes      | Flow identifier          |         |
| page\[size\]   | No       | Amount of items per page | 50      |
| page\[number\] | No       | Number of page           | 1       |


### Returns

The list of versions for the specified flow.

## Retrieve flow version by flow ID and its hash

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": {
      "id": "585918da586224001b96de88",
      "type": "flow-version",
      "attributes": {
         "version": "c77c09a2b5f9e528c6de443ea5cce5fca4fb8c10",
         "latest": true,
         "created_at": "2017-11-27T16:22:07.339Z",
         "name": "WebHook to Mailchimp",
         "cron": "*/3 * * * *",
         "graph": {
            "nodes": [
               {
                  "first": true,
                  "id": "step_1",
                  "function": "receive"
               },
               {
                  "id": "step_2",
                  "function": "map"
               },
               {
                  "id": "step_3",
                  "function": "subscribe"
               }
            ],
            "connections": [
               {
                  "to": "step_2",
                  "from": "step_1"
               },
               {
                  "to": "step_3",
                  "from": "step_2"
               }
            ]
         },
         "data": {
            "step_1": {
               "payload": "email,first,last"
            },
            "step_2": {
               "mapper": {
                  "lastName": "{{last}}",
                  "firstName": "{{first}}",
                  "email_type": "html",
                  "email": "{{email}}"
               },
               "lookupTables": {
                  "salutation": "lookup-table-id-to-be-used-for-salutation",
                  "create_new_lookup1": "new-lookup-id",
                  "create_new_lookup2": "new-lookup-id"
               }
            },
            "step_3": {
               "listId": "8779dd762e"
            }
         }
      },
      "links": {
         "self": "/v2/flows/585918da586224001b96de89/versions/c77c09a2b5f9e528c6de443ea5cce5fca4fb8c10"
      },
      "relationships": {
         "user": {
            "data": {
                "id": "585918da586224001b96de89",
                "type": "user"
            },
            "links": {
                "self": "/v2/users/585918da586224001b96de89"
            }
         },
         "flow": {
            "data": {
               "id": "585918da586224001b96de89",
               "type": "flow"
            },
            "links": {
               "self": "/v2/flows/585918da586224001b96de89"
            }
         }
      }
   }
}
```

This resource allows to you retrieve specific version of the flow by its version hash.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH}`

### URL Parameters

| Parameter    | Required | Description     |
| :----------- | :------- | :-------------- |
| FLOW_ID      | Yes      | Flow identifier |
| VERSION_HASH | Yes      | Version hash    |

### Returns

Specific version of the flow.

## Create a flow

> Example Request:


```shell
 curl https://api.elastic.io/v2/flows \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "data": {
        "type": "flow",
        "attributes": {
          "name": "Timer to E-Mail",
          "type": "ordinary",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "command": "elasticio/timer:timer",
                "fields": {
                  "interval": "minute"
                }
              },
              {
                "id": "step_2",
                "command": "elasticio/email:send"
              }
            ],
            "edges": [
              {
                "source": "step_1",
                "target": "step_2",
                "config": {
                  "mapper": {
                    "to": "info@acme.org",
                    "subject": "Test",
                    "textBody": "{{fireTime}}"
                  }
                }
              }
            ]
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
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data": {
    "type": "flow",
    "id": "585918da586224001b96de89",
    "attributes": {
      "name": "Timer to E-Mail Test",
      "status": "inactive",
      "type": "ordinary",
      "graph": {
        "nodes": [
          {
            "id": "step_1",
            "command": "elasticio/timer:timer",
            "fields": {
              "interval": "minute"
            }
          },
          {
            "id": "step_2",
            "command": "elasticio/email:send"
          }
        ],
        "edges": [
          {
            "source": "step_1",
            "target": "step_2",
            "config": {
              "mapper": {
                "to": "info@acme.org",
                "subject": "Test",
                "textBody": "{{fireTime}}"
              }
            }
          }
        ]
      }
    },
    "relationships": {
      "user": {
        "data": {
          "type": "user",
          "id": "560e5a27734d480a00000002"
        },
        "links": {
          "self": "/v2/users/560e5a27734d480a00000002"
        }
      },
      "organization": {
        "data": {
          "type": "organization",
          "id": "573dd76962436c349f000003"
        },
        "links": {
          "self": "/v2/organizations/573dd76962436c349f000003"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to create a new flow.

### HTTP Request

`POST https://api.elastic.io/v2/flows/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``flow`` |
| attributes.name | yes | Flow name |
| attributes.type | yes | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph | yes | Flow graph representing component connections |


### Returns

Returns the created flow

## Update a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
          "data": {
            "type": "flow",
            "id": "{FLOW_ID}",
            "attributes": {
              "name": "this is a test task"
            }
          }
    }'

```

```javascript
TBD
```

> Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "id": "58f07f67401e5f0019275306",
    "type": "flow",
    "links": {
      "self": "/v2/flows/58f07f67401e5f0019275306"
    },
    "attributes": {
      "name": "this is a test task",
      "status": "inactive",
      "type": "ordinary",
      "graph": {
        "nodes": [
          {
            "id": "step_1",
            "command": "elasticio/timer:timer",
            "fields": {
              "interval": "minute"
            }
          },
          {
            "id": "step_2",
            "command": "elasticio/email:send"
          }
        ],
        "edges": [
          {
            "source": "step_1",
            "target": "step_2",
            "config": {
              "mapper": {
                "textBody": "{{fireTime}}",
                "subject": "Test",
                "to": "info@acme.org"
              }
            }
          }
        ]
      },
      "api_version": "2.0"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "58c91bd02e669f0019243fdf",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/58c91bd02e669f0019243fdf"
        }
      },
      "organization": {
        "data": {
          "id": "57595b65cc6b4b0000000003",
          "type": "organization"
        },
        "links": {
          "self": "/v2/organizations/57595b65cc6b4b0000000003"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to update the given flow.

### HTTP Request

`PATCH https://api.elastic.io/v2/flows/{FLOW_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| FLOW_ID | yes | Flow ID |



### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``flow`` |
| id | yes | ID of the flow you want to update
| attributes.name | no | Flow name |
| attributes.type | no | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph | no | Flow graph representing component connections |
| attributes.cron | no | Cron expression representing flow timing |

### Returns

Returns the updated flow

## Start a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/start \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```

```javascript
TBD
```

> Example response

```http
HTTP/1.1 202 Accepted
```

This endpoint starts a flow with given ID.

### HTTP Request

`POST https://api.elastic.io/v2/flows/{FLOW_ID}/start`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Returns

Empty response


## Stop a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/stop \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```

```javascript
TBD
```

> Example response

```http
HTTP/1.1 202 Accepted
```

This endpoint stops a flow with given ID.

### HTTP Request

`POST https://api.elastic.io/v2/flows/{FLOW_ID}/stop`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Returns

Empty response

## Delete a flow

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```

```
 TBD
```

This resource allows you to delete a flow.

### HTTP Request

``DELETE https://api.elastic.io/v2/flows/{FLOW_ID}``


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| FLOW_ID | yes | Flow ID |

> Example Response:

```shell
HTTP/1.1 204 No Content
```