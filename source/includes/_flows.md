# Flows

## Retrieve all flows


> Example Request (with custom paging):

```shell
 curl '{{ api_base_url }}/v2/flows?workspace_id=59d341e9037f7200184a408b&page[size]=20&page[number]=1' \
   -g -u {EMAIL}:{APIKEY}
```


> Example Request (with filter):

```shell
 curl '{{ api_base_url }}/v2/flows?workspace_id=59d341e9037f7200184a408b&filter[status]=active' \
   -g -u {EMAIL}:{APIKEY}
```


> Example Request (with search):

```shell
 curl '{{ api_base_url }}/v2/flows?workspace_id=59d341e9037f7200184a408b&search=webhook' \
   -g -u {EMAIL}:{APIKEY}
```


> Example Request (with custom sorting):

```shell
 curl '{{ api_base_url }}/v2/flows?workspace_id=59d341e9037f7200184a408b&sort=-updated_at' \
   -g -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":[
    {
      "type":"flow",
      "id":"585918da586224001b96de89",
      "links":{
        "self":"/v2/flows/585918da586224001b96de89"
      },
      "attributes":{
        "name":"Timer to E-Mail Test",
        "status":"inactive",
        "type":"ordinary",
        "created_at":"2018-03-27T15:39:02.825Z",
        "current_status":"inactive",
        "default_mapper_type":"jsonata",
        "description":"",
        "updated_at":"2018-03-27T15:39:02.923Z",
        "graph":{
          "nodes":[
            {
              "id":"step_1",
              "component_id": "55ba18e35d04040500000004",
              "command":"{{ repo_name }}/timer:timer",
              "name":"",
              "description":"",
              "fields":{
                "interval":"minute"
              }
            },
            {
              "id":"step_2",
              "component_id": "593809a16b1d1f00196b74cd",
              "command":"{{ repo_name }}/email:send",
              "name":"",
              "description":""
            }
          ],
          "edges":[
            {
              "id":"mapper:step_1:step_2",
              "config":{
                "mapper_type":"jsonata",
                "condition":null,
                "mapper":{
                  "to":"\"test@example.com\"",
                  "subject":"\"StrongMapper\"",
                  "textBody":"Address.Street"
                }
              },
              "source":"step_1",
              "target":"step_2"
            }
          ]
        }
      },
      "relationships":{
        "user":{
          "data":{
            "type":"user",
            "id":"560e5a27734d480a00000002"
          },
          "links":{
            "self":"/v2/users/560e5a27734d480a00000002"
          }
        },
        "workspace":{
          "data":{
            "type":"workspace",
            "id":"573dd76962436c349f000003"
          },
          "links":{
            "self":"/v2/workspaces/573dd76962436c349f000003"
          }
        },
        "versions":{
          "links":{
            "related":"/v2/flows/585918da586224001b96de89/versions"
          }
        },
        "latest_version":{
          "data":{
            "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
            "type":"flow-version"
          },
          "links":{
            "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
            "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
          }
        }
      }
    }
  ],
  "meta":{
    "page":1,
    "per_page":10,
    "total":2,
    "total_pages":1
  },
  "links":{
    "self":"/v2/flows"
  }
}
```

This resource allows you to retrieve flows.

### HTTP Request

`GET {{ api_base_url }}/v2/flows/`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|workspace_id|yes|An Id of the Workspace|
| page[size]        | no | Amount of items per page. Default is `50`. |
| page[number]      | no | Number of page you want to display. Default is `1`. |
| filter[has_draft] | no | Filter flows only with or without a draft. May be `true` or `false`. |
| filter[status]    | no | Filter by `status`. May be any of: `active`, `inactive`. |
| filter[type]      | no | Filter by flow `type`. May be any of: `ordinary`, `long_running`. |
| filter[user]      | no | Filter by `user`. Must be `id` of `User` who created the flow. `User` could be found in relationships of the flow. |
| sort              | no | Sort flows list by certain field. May be `created_at`, `updated_at` or `name`. Prefix field name with `-` for reversed (desc) order e.g. `sort=-updated_at`. Default sort is by `id`. |
| search            | no | Search flows by a word or a phrase contained in a `description` OR in a `name`. Behavior is similar to operator `LIKE` in SQL. Case insensitive. Leading/following spaces are trimmed. |

### Returns

Returns all flows in the specified Workspace.

## Retrieve a flow by ID

> Example Request:


```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID} \
   -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"Timer to E-Mail Test",
      "status":"inactive",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":"",
      "updated_at":"2018-03-27T15:39:02.923Z",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id": "55ba18e35d04040500000004",
            "command":"{{ repo_name }}/timer:timer",
            "name":"",
            "description":"",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "component_id": "593809a16b1d1f00196b74cd",
            "command":"{{ repo_name }}/email:send",
            "name":"",
            "description":""
          }
        ],
        "edges":[
          {
            "id":"mapper:step_1:step_2",
            "config":{
              "mapper_type":"jsonata",
              "condition":null,
              "mapper":{
                "to":"\"test@example.com\"",
                "subject":"\"StrongMapper\"",
                "textBody":"Address.Street"
              }
            },
            "source":"step_1",
            "target":"step_2"
          }
        ]
      }
    },
    "relationships":{
      "user":{
        "data":{
          "type":"user",
          "id":"560e5a27734d480a00000002"
        },
        "links":{
          "self":"/v2/users/560e5a27734d480a00000002"
        }
      },
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"573dd76962436c349f000003"
        },
        "links":{
          "self":"/v2/workspaces/573dd76962436c349f000003"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/585918da586224001b96de89/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
          "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a flow by its identifier. If the flow with given ID does not belong to the current
user or to one of his Workspace, an error is returned.

### HTTP Request

`GET {{ api_base_url }}/v2/flows/{FLOW_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |


### Returns

The flow with given ID


## Create a flow

> Example Request:


```shell
 curl -X POST {{ api_base_url }}/v2/flows \
  -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {  
    "data":{
    "attributes":{
      "default_mapper_type":"jsonata",
      "type":"ordinary",
      "name":"My flow",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "cron":null,
      "graph":{
        "nodes":[
          {
            "name":"",
            "description":"",
            "command":"elasticio/simple-trigger-component:timer@latest",
            "fields":{

            },
            "id":"step_1",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "name":"My component",
            "description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            "command":"elasticio/code:execute@latest",
            "fields":{
              "code":"{{Put your custom Node.js code here}}"
            },
            "id":"step_2",
            "agent_id":"{AGENT_ID}",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "name":"",
            "description":"",
            "command":"help/petstore:createPetWithPromise@latest",
            "fields":{

            },
            "id":"step_3",
            "credentials_id":"{CREDENTIAL_ID}",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "name":"",
            "description":"",
            "command":"help/petstore:createPetWithPromise@latest",
            "fields":{

            },
            "id":"step_4",
            "credentials_id":"{CREDENTIAL_ID}",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          }
        ],
        "edges":[
          {
            "config":{
              "mapper":{

              },
              "condition":null
            },
            "source":"step_1",
            "target":"step_2"
          },
          {
            "config":{
              "mapper_type":"jsonata",
              "mapper":{
                "status":"\"sold\"",
                "name":"result"
              },
              "condition":null
            },
            "source":"step_2",
            "target":"step_3"
          },
          {
            "config":{
              "mapper_type":"jsonata",
              "mapper":{
                "status":"\"pending\"",
                "name":"result"
              },
              "condition":null
            },
            "source":"step_2",
            "target":"step_4"
          }
        ]
      }
    },
    "relationships":{
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"{WORKSPACE_ID}"
        }
      }
    },
    "type":"flow"
  }'

```



> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data":{
    "id":"{FLOW_ID}",
    "type":"flow",
    "links":{
      "self":"/v2/flows/{FLOW_ID}"
    },
    "attributes":{
      "api_version":"2.0",
      "created_at":"2019-06-27T14:28:17.918Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id":"{COMPONENT_ID}",
            "command":"elasticio/simple-trigger-component:timer@latest",
            "name":"",
            "description":"",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "id":"step_2",
            "component_id":"{COMPONENT_ID}",
            "command":"elasticio/code:execute@latest",
            "name":"My component",
            "description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            "agent_id":"{AGENT_ID}",
            "fields":{
              "code":"// Please note only Node.js code is supported here\nasync function run(msg) {\n\tconsole.log('Incoming message is %s', JSON.stringify(msg));\n\tconst body = { result : 'Hello world!' };\n\t// You can emit as many data messages as required\n\tawait this.emit('data', { body });\n\tconsole.log('Execution finished');\n}"
            },
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "id":"step_3",
            "component_id":"{COMPONENT_ID}",
            "command":"help/petstore:createPetWithPromise@latest",
            "name":"",
            "description":"",
            "credentials_id":"{CREDENTIAL_ID}",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "id":"step_4",
            "component_id":"{COMPONENT_ID}",
            "command":"help/petstore:createPetWithPromise@latest",
            "name":"",
            "description":"",
            "credentials_id":"{CREDENTIAL_ID}",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          }
        ],
        "edges":[
          {
            "id":"step_1:step_2",
            "source":"step_1",
            "target":"step_2"
          },
          {
            "id":"mapper:step_2:step_3",
            "config":{
              "mapper_type":"jsonata",
              "mapper":{
                "status":"\"sold\"",
                "name":"result"
              },
              "condition":null
            },
            "source":"step_2",
            "target":"step_3"
          },
          {
            "id":"mapper:step_2:step_4",
            "config":{
              "mapper_type":"jsonata",
              "mapper":{
                "status":"\"pending\"",
                "name":"result"
              },
              "condition":null
            },
            "source":"step_2",
            "target":"step_4"
          }
        ]
      },
      "last_modified":"2019-06-27T14:28:17.940Z",
      "name":"My flow",
      "status":"inactive",
      "type":"ordinary",
      "updated_at":"2019-06-27T14:28:17.940Z"
    },
    "relationships":{
      "user":{
        "data":{
          "id":"{USER_ID}",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/{USER_ID}"
        }
      },
      "workspace":{
        "data":{
          "id":"{WORKSPACE_ID}",
          "type":"workspace"
        },
        "links":{
          "self":"/v2/workspaces/{WORKSPACE_ID}"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/{FLOW_ID}/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"{FLOW_VERSION_ID}",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/{FLOW_ID}/versions/{FLOW_VERSION_ID}",
          "related":"/v2/flows/{FLOW_ID}/versions/{FLOW_VERSION_ID}"
        }
      }
    }
  },
  "meta":{}
```

This resource allows you to create a new flow.

### HTTP Request

`POST {{ api_base_url }}/v2/flows/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``flow`` |
| attributes.name | yes | Flow name |
| attributes.type | yes | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph | yes | Flow graph representing component connections |
| relationships.workspace.data.id | yes | An Id of the Workspace |
| relationships.workspace.data.type | yes | A value must be ``workspace``  |

### Authorization

This request is authorized for a user with the `workspaces.flow.edit` permission.

### Returns

Returns the created flow



## Update a flow

> Example request

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID} \
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


> Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"Timer to E-Mail Test",
      "status":"inactive",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":null,
      "updated_at":"2018-03-27T15:39:02.923Z",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id": "55ba18e35d04040500000004",
            "command":"{{ repo_name }}/timer:timer",
            "name":"",
            "description":"",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "component_id": "593809a16b1d1f00196b74cd",
            "command":"{{ repo_name }}/email:send",
            "name":"",
            "description":""
          }
        ],
        "edges":[
          {
            "source":"step_1",
            "target":"step_2",
            "config":{
              "mapper":{
                "to":"info@acme.org",
                "subject":"Test",
                "textBody":"FireTime"
              }
            }
          }
        ]
      }
    },
    "relationships":{
      "user":{
        "data":{
          "type":"user",
          "id":"560e5a27734d480a00000002"
        },
        "links":{
          "self":"/v2/users/560e5a27734d480a00000002"
        }
      },
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"573dd76962436c349f000003"
        },
        "links":{
          "self":"/v2/workspaces/573dd76962436c349f000003"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/585918da586224001b96de89/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
          "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update the given flow.

### HTTP Request

`PATCH {{ api_base_url }}/v2/flows/{FLOW_ID}`

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


### Authorization

This request is authorized for a user with the `workspaces.flow.edit` permission.


### Returns

Returns the updated flow

## Start a flow

> Example request

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/start \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```


> Example response

```http
HTTP/1.1 202 Accepted
{
  "data":{},
  "meta":{}
}
```

This endpoint starts a flow with given ID.

### HTTP Request

`POST {{ api_base_url }}/v2/flows/{FLOW_ID}/start`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Authorization

This request is authorized for a user with the `workspaces.flow.toggleStatus` permission.

### Returns

Empty response


## Stop a flow

> Example request

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/stop \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```


> Example response

```http
HTTP/1.1 202 Accepted
{
  "data":{},
  "meta":{}
}
```

This endpoint stops a flow with given ID.

### HTTP Request

`POST {{ api_base_url }}/v2/flows/{FLOW_ID}/stop`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Authorization

This request is authorized for a user with the `workspaces.flow.toggleStatus` permission.

### Returns

Empty response

## Delete a flow

> Example Request:

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete a flow.

### HTTP Request

``DELETE {{ api_base_url }}/v2/flows/{FLOW_ID}``


### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| FLOW_ID   | yes      | Flow ID     |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
