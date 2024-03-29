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
        },
        "vpn_agent":{
          "data":{
            "id":"59a410d76b670400182f190e",
            "type":"vpn-agent"
          },
          "links":{
            "self":"/v2/agents/vpn/59a410d76b670400182f190e"
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
|workspace_id|yes|An Id of the Workspace|
| filter[component] | No | Only credentials belong to the given component id


### Returns

Returns a list of credentials if the call succeeded.


## Retrieve a credential by ID


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
| CREDENTIAL_ID | Yes | Credential identifier |

### Returns

Returns a credential object if the call succeeded.

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
      "vpn_agent":{
        "data":{
          "id":"5a09deda2d5f49665afb739a",
          "type":"vpn-agent"
        },
        "links":{
          "self":"/v2/agents/vpn/5a09deda2d5f49665afb739a"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a credential.

### HTTP Request

`POST {{ api_base_url }}/v2/credentials/`


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``credential`` |
| attributes.name | no | Credential name. An automatic name will be generated if the parameter is omitted |
| attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.). Read more below |
| relationships.component.data.id | yes | The component id this credential is for |
| relationships.component.data.type | yes | A value must be ``component`` |
| relationships.workspace.data.id | yes | The Workspace id this credential is for |
| relationships.workspace.data.type | yes | A value must be ``workspace`` |
| relationships.vpn_agent | no | The vpn agent relation object |
| relationships.vpn_agent.data.id | no | The vpn agent id this credential is for |
| relationships.vpn_agent.data.type | no | A value must be `vpn-agent` |


### attributes.keys structure

API `attributes.keys` structure depends on [credentials.fields](https://docs.elastic.io/references/component-json-technical-reference-credentials.html#credentials-object-structure)
property of component's `component.json`. The keys from `credentials.fields` directly translate into keys of
`attributes.keys`.

Definition from `credentials.fields`:

![Definition from credentials fields](https://user-images.githubusercontent.com/28867440/107536968-0fa5f680-6bcb-11eb-9ce8-848b12f57fe1.png)

Expected `attributes.keys`:

![Expected attributes keys](https://user-images.githubusercontent.com/28867440/107536970-103e8d00-6bcb-11eb-8625-26e2bde135ae.png)

The value structure of a key in `attributes.keys` depends on
[viewClass](https://docs.elastic.io/references/view-classes). The structure of most frequently used view classes:

- `TextFieldView` - string. Example: `"password"`
- `CheckBoxView` - boolean. Example: `true`
- `SelectView` - list item from model. Example: `"chicken"`
- `WebhookAuthView` - object with structure:

 ![object with structure](https://user-images.githubusercontent.com/28867440/107536973-10d72380-6bcb-11eb-999c-33bb71c7939a.png)

  **Note.** This view must be the only view in a `credentials.fields` list and its key must be `auth`, so
  `attributes.keys` will look like:

  ![will look like](https://user-images.githubusercontent.com/28867440/107537499-9c50b480-6bcb-11eb-86f7-9b0477db78ea.png)


### Authorization
This request is authorized to only a user with `workspaces.credential.edit` permission

### Returns

Returns credential object if the call succeeded.



## Update a credential


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
               "vpn_agent": {
                   "data": {
                       "id": "59a410d76b670400182f190e",
                       "type": "vpn-agent"
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
      "vpn_agent":{
        "data":{
          "id":"5a09deda2d5f49665afb739a",
          "type":"vpn-agent"
        },
        "links":{
          "self":"/v2/agents/vpn/5a09deda2d5f49665afb739a"
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
| id | yes | A value must be the same as URL parameter ``CREDENTIAL_ID`` |
| type | yes | A value must be ``credential`` |
| attributes.name | no | Credential name. Will remain untouched if value omitted. |
| attributes.keys | no | An object which represents component's configuration. Will remain untouched if value omitted. Please note, that ``keys`` object is overwritten entirely. |
| relationships.vpn_agent | no | The vpn agent relation object. Will remain untouched if omitted. |
| relationships.vpn_agent.data.id | no | The vpn agent id this credential is for. |
| relationships.vpn_agent.data.type | no | A value must be `vpn-agent` |

### Authorization
This request is authorized to only a user with `workspaces.credential.edit` permission


### Returns

Returns a modified credential object if the call succeeded.

## Delete a credential
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


