#Credentials

## Get all credentials available for the user


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
                 }
             }
        }
    ]
}
```

This endpoint retrieves a list of credentials available for the user

### HTTP Request

`GET https://api.elastic.io/v2/credentials/`

### URL Query Parameters
Parameter         | Required | Description
----------------- | -------- | ----------- 
filter[component] | no       | Only credentials belong to the given component id 


### Returns

Returns a list of credentials if the call succeeded.


## Get a credential


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
            }
        }        
    }
}
```

This endpoint retrieves one of a credential available for the user

### HTTP Request

`GET https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
CREDENTIAL_ID | The ID of the credential

### Returns

Returns a credential object if the call succeeded.

## Add a new credential


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
            }
        }         
   }
}
```

This endpoint allows to create a new credential

### HTTP Request

`POST https://api.elastic.io/v2/credentials/`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
type | yes | A value should be "credential"
attributes.name | no | Credential name. An automatic name will be generated if the parameter is omitted
relationships.component.data.id | yes | The component id this credential is for
relationships.component.data.type | yes | A value should be "component"
attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.)


### Returns

Returns credential object if the call succeeded.



## Modify a credential


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
        }              
   }
}
```

This endpoint modifies credential

### HTTP Request
`PATCH https://api.elastic.io/v2/credentials/{CREDENTIAL_ID}/`

### URL Parameters
Parameter  | Description
---------- | -----------
CREDENTIAL_ID | The ID of the credential


### Arguments
Parameter       | Required | Description
--------------- | -------- | -----------
id              | yes      | A value should be the same as URL paramether CREDENTIAL_ID
type            | yes      | A value should be "credential"
attributes.name | no       | Credential name. Will remain untouched if value omitted.
attributes.keys | no       | An object which represents component's configuration. Will remain untouched if value omitted. Please note, that "keys" object is overwritten entirely.


### Returns

Returns a modified credential object if the call succeeded.
