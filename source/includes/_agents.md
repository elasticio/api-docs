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
|workspace_id|yes|Workspace ID |

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
| type | yes | Allowed value: ``agent`` |
| attributes.title | yes | Agent title |
| attributes.description | yes | Agent description |
| relationships.workspace.data.id | yes | Workspace ID  |
| relationships.workspace.data.type | yes | Allowed value: ``workspace``  |

### Returns

Returns the created agent object.


# VPN Agents (Experimental)

 <aside class="warning">
 <b>The VPN Agents section is an experimental API</b>
 </aside>
  
## Create a VPN agent

> Example Request:

```shell
curl {{ api_base_url }}/v2/agents/vpn \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "vpn-agent",
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
         "type":"vpn-agent",
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

This resource allows you to create a new VPN agent.

### HTTP Request

`POST {{ api_base_url }}/v2/agents/vpn`

### Body Parameters

| Parameter                                        | Required | Description  |
| :----------------------------------------------- | :------- | :----------- |
| type                                             | yes      | Allowed value: `vpn-agent`|
| attributes.name                                  | yes      | VPN Agent name  |
| attributes.port_mapping[].destination_ip         | yes      | Destination IP for traffic |
| attributes.port_mapping[].destination_port       | yes      | Destination Port for traffic |
| attributes.port_mapping[].protocol               | yes      | Traffic transfer protocol |
| relationships.workspace.data.id                  | yes      | Workspace ID |
| relationships.workspace.data.type                | yes      | Allowed value: `workspace`  |

### Authorization

This request is authorized to users with `workspaces.vpn_agent.create` permission.

### Returns

Returns the created VPN agent.


## Retrieve all VPN agents

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
         "type":"vpn-agent",
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
|workspace_id|yes|Workspace ID |

### Authorization

This request is authorized to users with `workspaces.vpn_agent.get` permission

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
         "type":"vpn-agent",
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
| workspace_id      | yes       | Workspace ID |
| vpn_agent_id      | yes       | VPN agent ID |

### Authorization

This request is authorized to users with `workspaces.vpn_agent.get` permission.

### Returns

Returns one VPN agent belonging to the given Workspace.


## Update a VPN agent

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
            "type": "vpn-agent",
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
         "type":"vpn-agent",
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

`PATCH {{ api_base_url }}/v2/agents/vpn/{VPN_AGENT_ID}`

### URL Parameters

| Parameter    | Required | Description  |
| :--------    | :------- | :----------  |
| VPN_AGENT_ID | yes      | VPN agent ID |

### Body Parameters

| Parameter                                        | Required | Description  |
| :----------------------------------------------- | :------- | :----------- |
| type                                             | yes      | Allowed value: `vpn-agent`|
| attributes.name                                  | no       | VPN Agent name  |
| attributes.port_mapping                          | no       | Traffic transfer parameters |
| attributes.port_mapping[].destination_ip         | yes      | Destination IP for traffic |
| attributes.port_mapping[].destination_port       | yes      | Destination Port for traffic |
| attributes.port_mapping[].protocol               | yes      | Traffic transfer protocol |
| relationships.workspace.data.id                  | yes      | Workspace ID |
| relationships.workspace.data.type                | yes      | Allowed value: ``workspace``  |

*Note:* `attributes.port_mapping` is not required, but if present all inner parameters are required.

### Authorization

This request is authorized to users with `workspaces.vpn_agent.edit` permission.

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
| workspace_id      | yes       | The ID of the Workspace |
| vpn_agent_id      | yes       | VPN agent ID |

### Authorization

This request is authorized to users with `workspaces.vpn_agent.delete` permission.

### Returns

Returns code `204` if the call was succeded.



## Retrieve a VPN agent config by VPN agent ID

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
| workspace_id      | yes       | Workspace ID |
| vpn_agent_id      | yes       | VPN agent ID |

### Authorization

This request is authorized to users with `workspaces.vpn_agent.get_config` permission.

### Returns

Returns one VPN agent config as attachment with name `agent-${VPN_AGENT_ID}.ovpn` that can be used as OpenVPN config.
