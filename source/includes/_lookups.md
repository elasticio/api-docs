#Lookup tables

## Get lookup tables
Lists available lookup tables

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

## Create lookup table

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


Parameter    | Required | Description
-------------| ---------| -----------
title         | yes      | Lookup table name
data      | yes       | key/value


##Update Lookup table


Parameter    | Required | Description
-------------| ---------| -----------
title         | yes      | Lookup table name
data      | yes       | key/value



> Example Request:

```shell
 curl https://api.elastic.io/v2/lookups/{LookupId} \
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

##Remove lookup table

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{LookupId} \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}'
```

```
 TBD
```

> Example Response:

```shell
HTTP/1.1 204 No Content
```
