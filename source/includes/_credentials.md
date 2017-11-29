#Credentials

## Retrieve all credentials


> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/?filter[component]={COMPONENT_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
// TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "meta": {},
    "data": [
        {
            "id": "585430d3f02852a8a9fac45e",
            "type": "credential",
            "attributes": {
                "name": "CMS primary",
                "keys": {
                    "oauth": {
                        "key": "secret1"
                    }
                }
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "585430d3f02852a8a9fac45d",
                        "type": "user"
                    },
                    "links": {
                        "self": "/v2/users/585430d3f02852a8a9fac45d"
                    }
                },
                "component": {
                    "data": {
                        "id": "585430d2f02852a8a9fac456",
                        "type": "component"
                    },
                    "links": {
                        "self": "/v2/components/585430d2f02852a8a9fac456"
                    }
                }
            }
        },
        {
            "id": "585430d3f02852a8a9fac45f",
            "type": "credential",
            "attributes": {
                "name": "Refined CRM Manager login",
                "keys": {
                    "oauth": {
                        "key": "secret2"
                    },
                    "allowOption": "enabled"
                }
            },
             "relationships": {
                 "user": {
                     "data": {
                         "id": "585430d3f02852a8a9fac45d",
                         "type": "user"
                     },
                     "links": {
                         "self": "/v2/users/585430d3f02852a8a9fac45d"
                     }
                 },
                 "component": {
                     "data": {
                         "id": "585430d2f02852a8a9fac457",
                         "type": "component"
                     },
                     "links": {
                         "self": "/v2/components/585430d2f02852a8a9fac457"
                     }
                 },
                 "agent": {
                    "data": {
                        "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    },
                    "links": {
                        "self": "/v2/agents/59a410d76b670400182f190e"
                    }
                 }
             }
        }
    ]
}
```

This resource allows you to retrieve all credentials belonging to the given user.

### HTTP Request

`GET https://api.elastic.io/v2/credentials/`

### Query Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| filter[component] | No | Only credentials belong to the given component id


### Returns

Returns a list of credentials if the call succeeded.


## Retrieve a credential by ID


> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "meta": {},
    "data": {
        "id": "585430d3f02852a8a9fac45e",
        "type": "credential",
        "attributes": {
            "name": "CMS primary",
            "keys": {
                "oauth": {
                    "key": "secret1"
                }
            }
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "585430d3f02852a8a9fac45d",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/585430d3f02852a8a9fac45d"
                }
            },
            "component": {
                "data": {
                    "id": "585430d2f02852a8a9fac456",
                    "type": "component"
                },
                "links": {
                    "self": "/v2/components/585430d2f02852a8a9fac456"
                }
            },
            "agent": {
                "data": {
                    "id": "59a410d76b670400182f190e",
                    "type": "agent"
                },
                "links": {
                    "self": "/v2/agents/59a410d76b670400182f190e"
                }
            }
        }        
    }
}
```

This resource allows you to retrieve a credential by its identifier. If the credential with given ID does not belong to the current user an error is returned.

### HTTP Request

`GET https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| CREDENTIAL_ID | Yes | Credential identifier |

### Returns

Returns a credential object if the call succeeded.

## Create a credential


> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/ \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "credential",
            "attributes": {
                "name": "Spreadsheet",
                    "keys": {
                        "oauth": {
                            "key": "secret1"
                        }
                }
            },
            "relationships": {
                "component": {
                    "data": {
                        "id": "585430d2f02852a8a9fac456",
                        "type": "component"
                    }
                },
                "agent": {
                    "data": {
                        "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    }
                }
            }
        }
    }'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
   "data": {
       "id": "585430d3f02852a8a9fac45e",
       "type": "credential",
       "attributes": {
           "name": "CMS primary",
           "keys": {
               "oauth": {
                   "key": "secret1"
               }
           }
       },
        "relationships": {
            "user": {
                "data": {
                    "id": "585430d3f02852a8a9fac45d",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/585430d3f02852a8a9fac45d"
                }
            },
            "component": {
                "data": {
                    "id": "585430d2f02852a8a9fac456",
                    "type": "component"
                },
                "links": {
                    "self": "/v2/components/585430d2f02852a8a9fac456"
                }
            },
            "agent": {
                "data": {
                    "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    },
                    "links": {
                        "self": "/v2/agents/59a410d76b670400182f190e"
                    }
                }
            }
        }         
   }
}
```

This resource allows you to create a credential.

### HTTP Request

`POST https://api.elastic.io/v2/credentials/`


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``credential`` |
| attributes.name | no | Credential name. An automatic name will be generated if the parameter is omitted |
| relationships.component.data.id | yes | The component id this credential is for |
| relationships.component.data.type | yes | A value must be ``component`` |
| relationships.agent | no | The agent relation object |
| relationships.agent.data.id | no | The agent id this credential is for |
| relationships.agent.data.type | no | A value must be ``agent`` |
| attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.) |


### Returns

Returns credential object if the call succeeded.



## Update a credential


> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/ \
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
            }             
        }
        "relationships": {
            "agent": {
                "data": {
                    "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    }
                }
            }
        }
    }'
```


```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": {
       "id": "585430d3f02852a8a9fac45e",
       "type": "credential",
       "attributes": {
           "name": "CMS primary",
           "keys": {
                "key1": "updated value"
           }
       },
        "relationships": {
            "component": {
                "data": {
                    "id": "585430d2f02852a8a9facaaa",
                    "type": "component"
                },
                "links": {
                    "self": "/v2/component/585430d2f02852a8a9facaaa"
                }                
            },
            "user": {
                "data": {
                    "id": "585430d3f02852a8a9fac45d",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/585430d3f02852a8a9fac45d"
                }
            }
            "agent": {
                "data": {
                    "id": "59a410d76b670400182f190e",
                        "type": "agent"
                    },
                    "links": {
                        "self": "/v2/agents/59a410d76b670400182f190e"
                    }
                }
            }            
        }              
   }
}
```

This resource allows you to update a credential.

### HTTP Request
`PATCH https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/`

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
| relationships.agent | no | The agent relation object. Will remain untouched if omitted. |
| relationships.agent.data.id | no | The agent id this credential is for. |
| relationships.agent.data.type | no | A value must be ``agent`` |


### Returns

Returns a modified credential object if the call succeeded.

## Delete a credential
> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/ \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a credential.

### HTTP Request
`DELETE https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| CREDENTIAL_ID | yes | Credential ID |
