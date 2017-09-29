# Data samples

## Retrieve data sample
This resource allows you to retrieve data sample.

> Example Request:

```shell
 curl https://api.elastic.io/v2/data-samples/{DATASAMPLE_ID} \
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
            "self": "/v2/data-samples/585d389b90ea62ce348a478b"
        },
        "relationships": {
            "component_version": {
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

#### Authorization

A member of an organization can get any sample from own organization. User without organization can get only own samples.

### HTTP Request

``GET https://api.elastic.io/v2/data-samples/{DATASAMPLE_ID}``































## Create data sample

> Example Request:

```shell
 curl https://api.elastic.io/v2/data-samples \
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
                "component_version": {
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
            "self": "/v2/data-samples/585d389b90ea62ce348a478b"
        },
        "relationships": {
            "component_version": {
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

``POST https://api.elastic.io/v2/data-samples``


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``data-sample`` |
| attributes.method | yes | Component's action or trigger name. |
| attributes.result | yes | Data sample body |
| relationships.component.data.id | yes | Component's id |
| relationships.component_version.data.id | yes | Revision of the component’s build. Use latest to retrieve the descriptor of the most recent successful build. |

### Returns

Returns data sample object if the call succeeded.

## Update data sample

> Example Request:

```shell
 curl https://api.elastic.io/v2/data-samples/{DATASAMPLE_ID} \
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
            "self": "/v2/data-samples/585d389b90ea62ce348a478b"
        },
        "relationships": {
            "component_version": {
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
                "foo": "bar",
                "baz": "foo"
            }
        }
    },
    "meta": {}
}
```

### HTTP Request

``PATCH https://api.elastic.io/v2/data-samples/{DATASAMPLE_ID}``


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``data-sample`` |
| attributes.method | no | Component's action or trigger name. |
| attributes.result | no | Data sample body |

### Returns

Returns updated data sample object if the call succeeded.
