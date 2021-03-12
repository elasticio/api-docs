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
            "command":"components/simple-trigger-component:timer@latest",
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
            "command":"components/code:execute@latest",
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
      },
      "nodes_config": {
        "step_1": {
          "passthrough": {
            "disabled": true
          }
        },
        "step_2": {
          "prefetch": 3,
          "log_level": "info"
        }
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
            "command":"components/simple-trigger-component:timer@latest",
            "name":"",
            "description":"",
            "selected_data_samples":[
              "{DATA_SAMPLE_ID}"
            ]
          },
          {
            "id":"step_2",
            "component_id":"{COMPONENT_ID}",
            "command":"components/code:execute@latest",
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
      "nodes_config": {
        "step_1": {
          "passthrough": {
            "disabled": true
          }
        },
        "step_2": {
          "prefetch": 3,
          "log_level": "info"
        }
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
| :---                                       | :---  | :---
| type                                                           | yes   | A value must be ``flow``
| attributes.name                                                | yes   | Flow name
| attributes.type                                                | yes   | Flow type. May be any of: ``ordinary``, ``long_running``
| attributes.graph                                               | yes   | Flow graph representing component connections
| attributes.graph.nodes[].secret_id                             | no    | [Auth Secret ID](#auth-secrets-(experimental)) to use for this step. It will be passed to a component action/trigger as a part of config
| attributes.default_mapper_type                                 | yes   | The mapper type. A value must be ``jsonata`` (The *handlebars* is now deprecated)
| attributes.nodes_config.{STEP_ID}.prefetch                     | no    | This parameter configures the maximum amount of messages, that the step can process simultaneously. Must be integer
| attributes.nodes_config.{STEP_ID}.passthrough.disabled         | no    | This parameter toggles passthrough for a step. May be any of: ``true``, ``false``
| attributes.nodes_config.{STEP_ID}.log_level                    | no    | Log level of component running in this step. Possible values are: ``trace``, ``debug``, ``info``, ``warn``, ``error``, ``fatal``, default: ``info``
| attributes.nodes_config.{STEP_ID}.disable_dynamic_flow_control | no    | This parameter configures disabling publisher confirms in sailor. May be any of: ``true``, ``false``
| relationships.workspace.data.id                                | yes   | An Id of the Workspace
| relationships.workspace.data.type                              | yes   | A value must be ``workspace``

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
              "name": "this is a test task",
              "nodes_config": {
                "step_1": {
                  "passthrough": {
                    "disabled": true
                  }
                },
                "step_2": {
                  "prefetch": 3,
                  "log_level": "info"
                }
              }
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
      "name":"this is a test task",
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
      },
      "nodes_config": {
        "step_1": {
          "passthrough": {
            "disabled": true
          }
        },
        "step_2": {
          "prefetch": 3,
          "log_level": "info"
        }
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

This resource allows you to update the given flow. A new version of the flow will be created. The new version becomes the latest version of the flow.

### HTTP Request

`PATCH {{ api_base_url }}/v2/flows/{FLOW_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| FLOW_ID | yes | Flow ID |



### Body Parameters

| Parameter | Required | Description |
| :---                                                    | :--- | :--- |
| type                                                    | yes | A value must be ``flow`` |
| id                                                      | yes | ID of the flow you want to update
| attributes.name                                         | no  | Flow name |
| attributes.type                                         | no  | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph                                        | no  | Flow graph representing component connections |
| attributes.graph.nodes[].secret_id                      | no  | [Auth Secret ID](#auth-secrets-(experimental)) to use for this step. It will be passed to a component action/trigger as a part of config
| attributes.cron                                         | no  | Cron expression representing flow timing |
| attributes.nodes_config.{STEP_ID}.prefetch              | no  | This parameter configures the maximum amount of messages, that the step can process simultaneously. Must be integer
| attributes.nodes_config.{STEP_ID}.passthrough.disabled  | no  | This parameter toggles passthrough for a step. May be any of: ``true``, ``false``
| attributes.nodes_config.{STEP_ID}.log_level             | no    | Log level of component running in this step. Possible values are: ``trace``, ``debug``, ``info``, ``warn``, ``error``, ``fatal``, default: ``info``


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
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"this is a test task",
      "status":"active",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":null,
      "updated_at":"2018-03-27T15:50:00.123Z",
      "last_start_time":"2018-03-27T15:50:00.123Z",
      "due_execution":"2018-03-27T15:53:00.123Z",
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
      },
      "nodes_config": {
        "step_1": {
          "passthrough": {
            "disabled": true
          }
        },
        "step_2": {
          "prefetch": 3,
          "log_level": "info"
        }
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

Returns the flow


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


## Copy Flow (Experimental)

Endpoint provides possibility to copy flow. Flow can be copied in two modes:

* as new flow
* as a draft of existing flow

Modes are mutually exclusive (see example requests)

In both cases flow is copied into draft of new/existing flow. So to make flow to work draft should be published manually. That is done to avoid disruptions of already running flow (flow is not stopped or changed in any other way except draft), and because most likely flow copy will require additional configuration.

Flow can be copied in any workspace and contract, of course if user has enough privileges to read original flow and has enough privileges to edit flow in destination workspace.

Platform forbids to copy flow if flow components can not be used in destination context (e.g. component visibility is restricted to team, and you are copying flow in another contract)

Please note the following facts about credentials, secrets, topics and agents used in flow:

 - All these entities are not copied along with the flow if they are not accessible in the destination context.
 - Naturally, if the flow is copied into the same workspace, these entities will be accessible to the flow draft.
 - Topic can be replaced during copy. Read details about `data.attributes.topic_id` parameter.


> Copy into existing flow example request:

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/copy \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "flow-copy",
            "attributes": {
                "dest_flow_id": "{DESTINATION_FLOW_ID}",
                "name": "{DRAFT_NAME}",
                "topic_id": "{TOPIC_ID}"
            }
        }
    }'
```

> Copy into new flow example request:

```shell
curl {{ api_base_url }}/v2/flows/{FLOW_ID}/copy \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "flow-copy",
            "attributes": {
                "name": "{DRAFT_NAME}",
                "topic_id": "{TOPIC_ID}"
            },
            "relationships": {
                "dest_workspace": {
                    "data": {
                        "id": "{DESTINATION_WORKSPACE_ID}",
                        "type": "workspace"
                    }
                }
            }
        }
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
        "nodes":[],
        "edges":[]
      },
      "nodes_config": {},
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
      "draft": {
         "data": {
           "id": "{DRAFT_ID}",
           "type": "flow-draft"
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



### HTTP Request

`POST {{ api_base_url }}/v2/flows/{FLOW_ID}/copy`

### URL parameters
| Parameter | Required | Description |
| :--- | :--- | :--- |
| FLOW_ID | yes | source flow identifier |

### Body Parameters

| Parameter | Required | Description |
| :---                                                    | :--- | :--- |
| data.type| yes | The value must be `flow-copy` |
| data.attributes.dest_flow_id | yes | Destination flow identifier (`dest_workspace` should not be specified) |
| data.relationships.dest_workspace.data.id | yes | Destination workspace identifier (`dest_flow_id` should not be specified) |
| data.relationships.dest_workspace.data.type | yes | The value must be `workspace` |
| data.attributes.topic_id | no | Required only if flow contains Pub-Sub components. Only one topic reference allowed |
| data.attributes.name | no | Makes possible to customize name of the draft (and flow when new flow is created) |

**Notices**

 1. The topic (`data.attributes.topic_id`) must be accessible to the flow in the destination workspace, otherwise it will not be copied.
 2. It's forbidden to use the `data.attributes.topic_id` parameter if flow does not contain at least one step with Pub/Sub component.
 3. It's forbidden to use the `data.attributes.topic_id` parameter if your flow uses more than one Pub/Sub topic in different steps. You can copy the flow if your flow has several Pub/Sub steps that uses only one topic.
 4. In case when the `data.attributes.topic_id` parameter is absent from your call, topics ID will be removed from a copy if it's not accessible and left intact if the topic is available in destination context.


### Authorization
- User should belong to workspace containing source flow.
- User should have `workspaces.flow.edit` permission in destination workspace.

### Returns

Returns created flow-draft or the draft for existing flow. If destination flow has the existing draft it will be overwritten.

Please notice once again: flow is copied as draft. So in response you may get empty flow (in `copy into new flow` mode) or old flow (in `copy into exsising flow` mode), as changes are done in draft, and draft is not included in response


