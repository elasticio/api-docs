# Agents
 

## Retrieve all agents


> Example Request:


```shell
curl {{ api_base_url }}/v2/agents?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":[
      {
         "id":"{AGENT_ID}",
         "type":"agent",
         "links":{
            "self":"/v2/agents/{AGENT_ID}"
         },
         "attributes":{
            "title":"agent title",
            "status":"online",
            "last_seen":"2017-10-04T19:02:19.188Z"
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   ],
   "meta":{}
}
```

This resource allows you to retrieve all the agents belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/agents?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|workspace_id|yes|An Id of the Workspace|

### Returns

Returns all the agents belonging to the given Workspace.


## Create agent


> Example Request:


```shell
curl {{ api_base_url }}/v2/agents \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"agent",
       "attributes":{
         "title":"agent title",
         "description":"agent description"
       },
       "relationships":{
         "workspace":{
           "data":{
             "id":"{WORKSPACE_ID}",
             "type":"workspace"
           }
         }
       }
     }
   }'
```



> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
   "data":{
      "id":"{AGENT_ID}",
      "type":"agent",
      "links":{
         "self":"/v2/agents/{AGENT_ID}"
      },
      "attributes":{
         "title":"agent title",
         "description":"agent description",
         "status":"pending"
      },
      "relationships":{
         "workspace":{
            "data":{
               "id":"{WORKSPACE_ID}",
               "type":"workspace"
            },
            "links":{
               "self":"/v2/workspaces/{WORKSPACE_ID}"
            }
         }
      }
   },
   "meta":{}
}
```

This resource allows you to create a new agent. The agent is created in ``pending`` state and our support is informed about it.
We will contact you within 2-3 working days.

### HTTP Request

`POST {{ api_base_url }}/v2/agents/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``agent`` |
| attributes.title | yes | Agent title |
| attributes.description | yes | Agent description |
| relationships.workspace.data.id | yes | An Id of the Workspace |
| relationships.workspace.data.type | yes | A value must be ``workspace``  |

### Returns

Returns the created agent object.


#VPN Agents (Experimental)

 <aside class="warning">
 <b>The VPN Agents section is an experimental API</b>
 </aside>
  
## Create a vpn agent

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "vpn_agent",
            "attributes": {
                "name":"name of the agent",
                "port_mapping":[{
                    "destination_ip":"1.1.1.1",
                    "destination_port":8888,
                    "protocol":"tcp"
                }]
            },
            "relationships": {
                "workspace": {
                    "data": {
                        "type": "workspace",
                        "id": {WORKSPACE_ID}
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
      {
         "id":"{VPN_AGENT_ID}",
         "type":"vpn_agent",
         "links":{
            "self":"/v2/agents/vpn/{VPN_AGENT_ID}"
         },
         "attributes":{
            "name":"agent name",
            "status":"online",
            "port_mapping":[{
                "destination_ip":"1.1.1.1",
                "destination_port":8888,
                "protocol":"tcp",
                "port":1234
            }]
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   },
   "meta":{}
}
```

This resource allows you to create a new recipe.

### HTTP Request

`POST {{ api_base_url }}/v2/agents/vpn`

### Body Parameters

| Parameter                                        | Required | Description  |
| :----------------------------------------------- | :------- | :----------- |
| type                                             | yes      | A value must be `vpn_agent`|
| attributes.name                                  | yes      | Vpn Agent name  |
| attributes.port_mapping.0.destination_ip         | yes      | Ip traffic will be transferred to |
| attributes.port_mapping.0.destination_port       | yes      | Port traffic will be transferred to |
| attributes.port_mapping.0.protocol               | yes      | Protocol traffic will be transferred by |
| relationships.workspace.data.id                  | yes      | An Id of the Workspace |
| relationships.workspace.data.type                | yes      | A value must be ``workspace``  |

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.create` permission

### Returns

Returns the created vpn agent


## Retrieve all vpn agents

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":[
      {
         "id":"{VPN_AGENT_ID}",
         "type":"vpn_agent",
         "links":{
            "self":"/v2/agents/vpn/{VPN_AGENT_ID}"
         },
         "attributes":{
            "name":"agent name",
            "status":"online",
            "port_mapping":[{
                "destination_ip": "1.1.1.1",
                "destination_port": 8888,
                "protocol": "tcp",
                "port": 1234
            }]
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   ],
   "meta":{}
}
```

This resource allows you to retrieve all the agents belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/agents/vpn?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|workspace_id|yes|An Id of the Workspace|

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.get` permission

### Returns

Returns all the vpn agents belonging to the given Workspace.


## Retrieve a vpn agent by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":{
      {
         "id":"{VPN_AGENT_ID}",
         "type":"vpn_agent",
         "links":{
            "self":"/v2/agents/vpn/{VPN_AGENT_ID}"
         },
         "attributes":{
            "name":"agent name",
            "status":"online",
            "port_mapping":[{
                "destination_ip": '1.1.1.1',
                destination_port: 8888,
                protocol: 'tcp',
                port: 1234
            }]
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   },
   "meta":{}
}
```

This resource allows you to retrieve one agent belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| workspace_id      | yes       | An Id of the Workspace |
| vpn_agent_id      | yes       | An Id of the Workspace |

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.get` permission

### Returns

Returns one vpn agent belonging to the given Workspace.


## Update a vpn agent

> Example request

```shell
curl {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID} \
    -X PATCH \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "id":"{VPN_AGENT_ID}"
            "type": "vpn_agent",
            "attributes": {
                "name":"name of the agent",
                "port_mapping":[{
                    "destination_ip":"1.1.1.1",
                    "destination_port":8888,
                    "protocol":"tcp"
                }]
            },
            "relationships": {
                "workspace": {
                    "data": {
                        "type": "workspace",
                        "id": {WORKSPACE_ID}
                    }
                }
            }
        }
    }'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":{
      {
         "id":"{VPN_AGENT_ID}",
         "type":"vpn_agent",
         "links":{
            "self":"/v2/agents/vpn/{VPN_AGENT_ID}"
         },
         "attributes":{
            "name":"agent name",
            "status":"online",
            "port_mapping":[{
                "destination_ip":"1.1.1.1",
                destination_port: 8888,
                protocol:"tcp",
                port: 1234
            }]
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   },
   "meta":{}
}
```

This resource allows you to update the given vpn agent.

### HTTP Request

`PATCH {{ api_base_url }}/v2/recipes/{RECIPE_ID}`

### URL Parameters

| Parameter    | Required | Description  |
| :--------    | :------- | :----------  |
| VPN_AGENT_ID | yes      | Vpn agent ID |

### Body Parameters

| Parameter                                        | Required | Description  |
| :----------------------------------------------- | :------- | :----------- |
| type                                             | yes      | A value must be `vpn_agent`|
| attributes.name                                  | no       | Vpn Agent name  |
| attributes.port_mapping                          | no       | Traffic transfer parameters |
| attributes.port_mapping.0.destination_ip         | yes      | Ip traffic will be transferred to |
| attributes.port_mapping.0.destination_port       | yes      | Port traffic will be transferred to |
| attributes.port_mapping.0.protocol               | yes      | Protocol traffic will be transferred by |
| relationships.workspace.data.id                  | yes      | An Id of the Workspace |
| relationships.workspace.data.type                | yes      | A value must be ``workspace``  |

*Note:* `attributes.port_mapping` is not required, but if present all inner parameters are required.

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.edit` permission

### Returns

Returns the updated vpn agent


## Delete a vpn agent

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}?workspace_id={WORKSPACE_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
```

> Example Response:

```http
HTTP/1.1 204 OK
Content-Type: application/json
```

This resource allows you to delete a vpn agent.

### HTTP Request

`DELETE {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| workspace_id      | yes       | An Id of the Workspace |
| vpn_agent_id      | yes       | An Id of the Workspace |

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.get` permission

### Returns

Returns one vpn agent belonging to the given Workspace.



## Retrieve a vpn agent config by vpn agent ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}/config?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: text/plain

config text
```

This resource allows you to retrieve one agent config belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}/config?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| workspace_id      | yes       | An Id of the Workspace |
| vpn_agent_id      | yes       | An Id of the Workspace |

### Authorization

This request is authorized to only a user with `workspaces.vpn_agent.get_config` permission

### Returns

Returns one vpn agent config as attachment with name `agent-${VPN_AGENT_ID}.ovpn` that can be used as OpenVPN config.
