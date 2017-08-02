# Datasamples

## Retrieve data sample
This resource allows you to retrieve data sample.

> Example Request:

```shell
 curl https://api.elastic.io/v2/samples/{DATASAMPLE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

> Example Response:

```json
{
    "data": {
        "id": "{DATASAMPLE_ID}",
        "type": "data-sample",
        "links": {
            "self": "/v2/samples/585d389b90ea62ce348a478b"
        },
        "relationships": {
            "componentVersion": {
                "data": {
                    "id": "latest",
                    "type": "version"
                },
                "links": {
                    "self": "/v2/components/5863f7136ef9da255ad9a9bc/versions/latest"
                }
            },
            "component": {
                "data": {
                    "id": "5863f7136ef9da255ad9a9bc",
                    "type": "component"
                },
                "links": {
                    "self": "/v2/components/5863f7136ef9da255ad9a9bc"
                }
            },
            "user": {
                "data": {
                    "id": "585d389b90ea62ce348a478b",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/${client.id}"
                }
            }
        },
        "attributes": {
            "method": "hello123",
            "result": {
                "foo": "bar1",
                "baz": "qwe1"
            }
        }
    },
    "meta": {}
}
```

### HTTP Request

``GET https://api.elastic.io/v2/samples/{DATASAMPLE_ID}``

## Create data sample

> Example Request:

```shell
 curl https://api.elastic.io/v2/samples \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
        "data": {
            "type": "data-sample",
            "attributes": {
                "method": "hello123",
                "result": {
                    "foo": "bar",
                    "baz": "foo"
                }
            },
            "relationships": {
                "component": {
                    "data": {
                        "id": "5863f7136ef9da255ad9a9bc",
                        "type": "component"
                    }
                },
                "componentVersion": {
                    "data": {
                        "id": "latest",
                        "type": "version"
                    }
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
        "id": "585d389b90ea62ce348a478b",
        "type": "data-sample",
        "links": {
            "self": "/v2/samples/585d389b90ea62ce348a478b"
        },
        "relationships": {
            "componentVersion": {
                "data": {
                    "id": "latest",
                    "type": "version"
                },
                "links": {
                    "self": "/v2/components/5863f7136ef9da255ad9a9bc/versions/latest"
                }
            },
            "component": {
                "data": {
                    "id": "5863f7136ef9da255ad9a9bc",
                    "type": "component"
                },
                "links": {
                    "self": "/v2/components/5863f7136ef9da255ad9a9bc"
                }
            },
            "user": {
                "data": {
                    "id": "585d389b90ea62ce348a478b",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/${client.id}"
                }
            }
        },
        "attributes": {
            "method": "hello123",
            "result": {
                "foo": "bar1",
                "baz": "qwe1"
            }
        }
    },
    "meta": {}
}
```

### HTTP Request

``POST https://api.elastic.io/v2/samples``


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``lookup`` |
| attributes.method | yes | Component's action or trigger name. |
| attributes.result | yes | Data sample body |
| relationships.component.data.id | yes | Component's id |
| relationships.componentVersion.data.id | yes | Component's version |
