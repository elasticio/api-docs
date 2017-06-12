# Lookup tables

## Retrieve all lookup tables
This resource allows you to retrieve all lookup tables.

> Example Request:

```shell
 curl https://api.elastic.io/v2/lookups \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```json

{
    "data": [{
        "type": "lookup",
        "id": "5863f65ecc753f2441c88e68",
        "attributes": {
            "title": "lookup title",
            "data": {
              "key": "value"
            }
        },
        "relationships": {
            "user": {
                "data": {
                    "type": "user",
                    "id": "585d389b90ea62ce348a478b"
                },
                "links": {
                    "self": "/v2/users/585d389b90ea62ce348a478b"
                }
            },
            "organization": {
                "data": {
                    "type": "organization",
                    "id": "58400dc7c9ab5757f8ef1f81"
                },
                "links": {
                    "self": "/v2/organizations/58400dc7c9ab5757f8ef1f81"
                }
            }
        }
    }],
    "meta": {}
}
```

### HTTP Request

``GET https://api.elastic.io/v2/lookups``

## Create a lookup table

> Example Request:

```shell
 curl https://api.elastic.io/v2/lookups \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "data": {
          "type": "lookup",
          "attributes": {
              "title": "lookup example",
              "data": {
                  "key": "value"
              }
          }
      }
   }'
```

```
 TBD
```

> Example Response:

```json
{
    "data": {
        "type": "lookup",
        "id": "5863f7136ef9da255ad9a9bc",
        "attributes": {
            "title": "mylookuptitle",
            "data": {
                "key": "value"
            }
        },
        "relationships": {
            "user": {
                "data": {
                    "type": "user",
                    "id": "585d389b90ea62ce348a478b"
                },
                "links": {
                    "self": "/v2/users/585d389b90ea62ce348a478b"
                }
            },
            "organization": {
                "data": {
                    "type": "organization",
                    "id": "58400dc7c9ab5757f8ef1f81"
                },
                "links": {
                    "self": "/v2/organizations/58400dc7c9ab5757f8ef1f81"
                }
            }
        }
    },
    "meta": {}
}
```

### HTTP Request

``POST https://api.elastic.io/v2/lookups``


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``lookup`` |
| attributes.title | yes | Lookup table title. |
| attributes.data | yes | A JSON object representing a lookup table |


## Update a lookup table



> Example Request:

```shell
 curl https://api.elastic.io/v2/lookups/{LOOKUP_ID} \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "data": {
          "type": "lookup",
          "id": "{LookupId}",
          "attributes": {
              "title": "new lookup title",
              "data": {
                  "key": "value"
              }
          }
      }
   }'
```

```
 TBD
```

This resource allows you to update a lookup table.

### HTTP Request

``PUT https://api.elastic.io/v2/lookups``


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| LOOKUP_ID | yes | Lookup table ID |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``lookup`` |
| attributes.title | yes | Lookup table title. |
| attributes.data | yes | A JSON object representing a lookup table |

## Delete a lookup table

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{LOOKUP_ID} \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}'
```

```
 TBD
```

This resource allows you to delete a lookup table.

### HTTP Request

``DELETE https://api.elastic.io/v2/lookups/{LOOKUP_ID}``


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| LOOKUP_ID | yes | Lookup table ID |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
