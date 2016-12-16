#Credentials

## Get all credentials available for the user


> Example Request:


```shell
curl https://api.elastic.io/v2/credentials/?[component_id={COMPONENT_ID}] \
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
                "component_id": "585430d2f02852a8a9fac456",
                "user": "585430d3f02852a8a9fac45d",
                "keys": {
                    "oauth": {
                        "key": "secret1"
                    }
                }
            }
        },
        {
            "id": "585430d3f02852a8a9fac45f",
            "type": "credential",
            "attributes": {
                "name": "Refined CRM Manager login",
                "component_id": "585430d2f02852a8a9fac457",
                "user": "585430d3f02852a8a9fac45d",
                "keys": {
                    "oauth": {
                        "key": "secret2"
                    },
                    "allowOption": "enabled"
                }
            }
        }
    ]
}
```

This endpoint retrieves list of credentials available for the user

### HTTP Request

`GET https://api.elastic.io/v2/credentials/`

### URL Parameters


Parameter | Required | Description
--------- | ----------- | ----------- 
COMPONENT_ID| no | A filter, which returns only credentials belong to the given component id 


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
            "component_id": "585430d2f02852a8a9fac456",
            "user": "585430d3f02852a8a9fac45d",
            "keys": {
                "oauth": {
                    "key": "secret1"
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
//TODO discuss if we are going to consider type as obligatory param in JSON
 curl https://api.elastic.io/v2/credentials/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "credential",
           "attributes": {
               "name": "Spreadsheet",
               "component_id": "585430d2f02852a8a9fac456",
               "keys": {
                   "oauth": {
                       "key": "secret1"
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
           "component_id": "585430d2f02852a8a9fac456",
           "user": "585430d3f02852a8a9fac45d",
           "keys": {
               "oauth": {
                   "key": "secret1"
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
attributes.component_id | yes | The component id this credential is for
attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.)


### Returns

Returns credential object if the call succeeded.



## Modify a credential


> Example Request:


```shell
//TODO discuss if we are going to consider type and id as obligatory param in JSON
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
                 "name": "CMS secondary"               
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
           "name": "CMS secondary",
           "component_id": "585430d2f02852a8a9fac456",
           "user": "585430d3f02852a8a9fac45d",
           "keys": {
               "oauth": {
                   "key": "secret1"
               }
           }
       }
   }
}

This endpoint modifies credential

### HTTP Request

`PUT https://api.elastic.io/v2/credentials/{CREDENTIAL_ID_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
CREDENTIAL_ID | The ID of the credential


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
id | yes | A value should be the same as URL paramether CREDENTIAL_ID
type | yes | A value should be "credential"
attributes.name | no | Credential name. Will remain untouched if value omitted.
attributes.component_id | no | The component id this credential is for. Will remain untouched if value omitted.
attributes.keys | no | An object which represents component's configuration (OAuth keys, etc.) Will remain untouched if value omitted.


### Returns

Returns a modified credential object if the call succeeded.
