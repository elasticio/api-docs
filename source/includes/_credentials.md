# Credentials

## Retrieve all credentials


> Example Request:


```shell
curl {{ api_base_url }}/v2/credentials/?filter[component]={COMPONENT_ID}&workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "meta":{},
  "data":[
    {
      "id":"585430d3f02852a8a9fac45e",
      "type":"credential",
      "links":{
        "self":"/v2/credentials/585430d3f02852a8a9fac45e"
      },
      "attributes":{
        "name":"CMS primary",
        "keys":{
          "oauth":{
            "key":"secret1"
          }
        }
      },
      "relationships":{
        "user":{
          "data":{
            "id":"585430d3f02852a8a9fac45d",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/585430d3f02852a8a9fac45d"
          }
        },
        "component":{
          "data":{
            "id":"585430d2f02852a8a9fac456",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/585430d2f02852a8a9fac456"
          }
        },
        "workspace":{
          "data":{
            "id":"59d341e9037f7200184a408b",
            "type":"workspace"
          },
          "links":{
            "self":"/v2/workspaces/59d341e9037f7200184a408b"
          }
        }
      }
    },
    {
      "id":"585430d3f02852a8a9fac45f",
      "type":"credential",
      "links":{
        "self":"/v2/credentials/585430d3f02852a8a9fac45f"
      },
      "attributes":{
        "name":"Refined CRM Manager login",
        "keys":{
          "oauth":{
            "key":"secret2"
          },
          "allowOption":"enabled"
        }
      },
      "relationships":{
        "user":{
          "data":{
            "id":"585430d3f02852a8a9fac45d",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/585430d3f02852a8a9fac45d"
          }
        },
        "component":{
          "data":{
            "id":"585430d2f02852a8a9fac457",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/585430d2f02852a8a9fac457"
          }
        },
        "workspace":{
          "data":{
            "id":"59d341e9037f7200184a408b",
            "type":"workspace"
          },
          "links":{
            "self":"/v2/workspaces/59d341e9037f7200184a408b"
          },
          "agent":{
            "data":{
              "id":"59a410d76b670400182f190e",
              "type":"agent"
            },
            "links":{
              "self":"/v2/agents/59a410d76b670400182f190e"
            }
          },
           "vpn_agent":{
             "data":{
               "id":"59d341e9037f7200184a4000",
               "type":"vpn-agent"
             },
             "links":{
               "self":"/v2/agents/vpn/59d341e9037f7200184a4000"
             }
           }
        }
      }
    }
  ],
  "links":{
    "self":"/v2/credentials"
  }
}
```

This resource allows you to retrieve all credentials belonging to user's Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/credentials/?workspace_id={WORKSPACE_ID}&filter[component]={COMPONENT_ID}`

### Query Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
|workspace_id|yes|Workspace ID|
| filter[component] | No | Filter Credentials by Component ID|


### Returns

Returns a list of credentials on success.


## Retrieve a Credential by ID


> Example Request:


```shell
curl {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{  
  "data":{  
    "id":"59f9f2ba112f28001921f274",
    "type":"credential",
    "links":{  
      "self":"/v2/credentials/59f9f2ba112f28001921f274"
    },
    "attributes":{  
      "name":"SFTP account",
      "keys":{  
        "host":"sftp.company.org",
        "username":"lord",
        "password":"teststetr"
      }
    },
    "relationships":{  
      "user":{  
        "data":{  
          "id":"59f747c33f1d3c001901a44e",
          "type":"user"
        },
        "links":{  
          "self":"/v2/users/59f747c33f1d3c001901a44e"
        }
      },
      "component":{  
        "data":{  
          "id":"56793fb4d8057406000000f7",
          "type":"component"
        },
        "links":{  
          "self":"/v2/components/56793fb4d8057406000000f7"
        }
      },
      "workspace":{  
        "data":{  
          "id":"59d341e9037f7200184a408b",
          "type":"workspace"
        },
        "links":{  
          "self":"/v2/workspaces/59d341e9037f7200184a408b"
        }
      },
      "vpn_agent":{
        "data":{
          "id":"59d341e9037f7200184a4000",
          "type":"vpn-agent"
        },
        "links":{
          "self":"/v2/agents/vpn/59d341e9037f7200184a4000"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a credential by its identifier. 

### HTTP Request

`GET {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| CREDENTIAL_ID | Yes | Credential ID |

### Returns

Returns a credential object on success.

## Create a credential


> Example Request:


```shell
curl {{ api_base_url }}/v2/credentials/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"credential",
       "attributes":{
         "name":"credname",
         "keys":{
           "host":"hostname",
           "username":"username",
           "password":"pass"
         }
       },
       "relationships":{
         "component":{
           "data":{
             "id":"56793fb4d8057406000000f7",
             "type":"component"
           }
         },
         "workspace":{
           "data":{
             "id":"59d341e9037f7200184a408b",
             "type":"workspace"
           }
         },
         "vpn_agent":{
           "data":{
             "id":"59d341e9037f7200184a4000",
             "type":"vpn-agent"
           },
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
    "id":"5abe11edbec1cf00078b81d1",
    "type":"credential",
    "links":{  
      "self":"/v2/credentials/5abe11edbec1cf00078b81d1"
    },
    "attributes":{  
      "name":"credname",
      "keys":{  
        "host":"hostname",
        "username":"username",
        "password":"pass"
      }
    },
    "relationships":{  
      "user":{  
        "data":{  
          "id":"59d3562c68ed850019bde27f",
          "type":"user"
        },
        "links":{  
          "self":"/v2/users/59d3562c68ed850019bde27f"
        }
      },
      "component":{  
        "data":{  
          "id":"56793fb4d8057406000000f7",
          "type":"component"
        },
        "links":{  
          "self":"/v2/components/56793fb4d8057406000000f7"
        }
      },
      "workspace":{  
        "data":{  
          "id":"59d341e9037f7200184a408b",
          "type":"workspace"
        },
        "links":{  
          "self":"/v2/workspaces/59d341e9037f7200184a408b"
        }
      },
      "agent":{  
        "data":{  
          "id":"5a09deda2d5f49665afb739a",
          "type":"agent"
        },
        "links":{  
          "self":"/v2/agents/5a09deda2d5f49665afb739a"
        }
      },
      "vpn_agent":{
        "data":{
          "id":"59d341e9037f7200184a4000",
          "type":"vpn-agent"
        },
        "links":{
          "self":"/v2/agents/vpn/59d341e9037f7200184a4000"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a Credential.

### HTTP Request

`POST {{ api_base_url }}/v2/credentials/`


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``credential`` |
| attributes.name | no | Credential name. An automatic name will be generated if the parameter is omitted |
| relationships.component.data.id | yes | The component id this credential is for |
| relationships.component.data.type | yes | Allowed value: ``component`` |
| relationships.workspace.data.id | yes | The Workspace id this credential is for |
| relationships.workspace.data.type | yes | Allowed value: ``workspace`` |
| relationships.agent | no | The agent relation object. Mutually exclusive with `relationships.vpn_agent`, so you can use only one of them at a time. |
| relationships.agent.data.id | no | The agent ID this Credential is for |
| relationships.agent.data.type | no | Allowed value: ``agent`` |
| relationships.vpn_agent | no | The VPN agent relation object. Mutually exclusive with `relationships.agent`, so you can use only one of them at a time. |
| relationships.vpn_agent.data.id | no | The VPN agent ID this credential is for |
| relationships.vpn_agent.data.type | no | Allowed value: ``vpn-agent`` |
| attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.) |


### Authorization
This request is authorized to users with `workspaces.credential.edit` permission.

### Returns

Returns credential object on success.



## Update a Credential


> Example Request:


```shell
curl {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/ \
    -u {EMAIL}:{APIKEY} \
    -X PATCH \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
        {
            "data": {
                "id": "585430d3f02852a8a9fac45e",
                "type": "credential",
            "attributes": {
                "keys": {
                    "key1": "updated value"  
                }
            },                  
            "relationships": {
                "agent": {
                    "data": {
                        "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    }
                },
                "vpn_agent": {
                    "data": {
                        "id": "59a410d76b670400182f1aaa",
                        "type": "vpn-agent"
                    }
                },
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
    "id":"5aaff19dbd6d6400079b4624",
    "type":"credential",
    "links":{  
      "self":"/v2/credentials/5aaff19dbd6d6400079b4624"
    },
    "attributes":{  
      "name":"luzho4ek777",
      "keys":{  
        "host":"sftp.company.org",
        "username":"asssssa",
        "password":"qweqweqw"
      }
    },
    "relationships":{  
      "user":{  
        "data":{  
          "id":"59d3562c68ed850019bde27f",
          "type":"user"
        },
        "links":{  
          "self":"/v2/users/59d3562c68ed850019bde27f"
        }
      },
      "component":{  
        "data":{  
          "id":"56793fb4d8057406000000f7",
          "type":"component"
        },
        "links":{  
          "self":"/v2/components/56793fb4d8057406000000f7"
        }
      },
      "workspace":{  
        "data":{  
          "id":"59d341e9037f7200184a408b",
          "type":"workspace"
        },
        "links":{  
          "self":"/v2/workspaces/59d341e9037f7200184a408b"
        }
      },
      "agent":{  
        "data":{  
          "id":"5a09deda2d5f49665afb739a",
          "type":"agent"
        },
        "links":{  
          "self":"/v2/agents/5a09deda2d5f49665afb739a"
        }
      },
      "vpn_agent":{  
        "data":{  
          "id":"59a410d76b670400182f1aaa",
          "type":"vpn-agent"
        },
        "links":{  
          "self":"/v2/agents/vpns/59a410d76b670400182f1aaa"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update a credential.

### HTTP Request
`PATCH {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| CREDENTIAL_ID | yes | Credential ID |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| id | yes | The value must be the same as URL parameter ``CREDENTIAL_ID`` |
| type | yes | Allowed value: ``credential`` |
| attributes.name | no | Credential name. Will remain untouched if no value entered. |
| attributes.keys | no | An object which represents component's configuration. Will remain untouched if no value entered. Please note, that ``keys`` object is overwritten entirely. |
| relationships.agent | no | The agent relation object. Mutually exclusive with `relationships.vpn_agent`, so you can use only one of them at a time. |
| relationships.agent.data.id | no | The agent ID this credential is for. |
| relationships.agent.data.type | no | Allowed value: ``agent`` |
| relationships.vpn_agent | no | The VPN agent relation object. Mutually exclusive with `relationships.agent`, so you can use only one of them at a time. |
| relationships.vpn_agent.data.id | no | The VPN agent ID this credential is for. |
| relationships.vpn_agent.data.type | no | Allowed value: ``vpn-agent`` |

### Authorization
This request is authorized to only a user with `workspaces.credential.edit` permission


### Returns

Returns a modified credential object if the call succeeded.

## Delete a Credential
> Example Request:


```shell
curl {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/ \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a credential.

### HTTP Request
`DELETE {{ api_base_url }}/v2/credentials/{CREDENTIAL_ID}/`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| CREDENTIAL_ID | yes | Credential ID |

### Authorization
This request is authorized to only a user with `workspaces.credential.edit` permission

### Returns
204 HTTP response code if the call succeeds, error otherwise.


