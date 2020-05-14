## What is a Topic unit?

The Topic is a JSON schema to be used to communicate publisher and many subscribers.

## Create a Topic

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
  "data":{
    "type":"topic",
    "attributes":{
      "name":"Person",
      "schema":{
        "$id":"https://example.com/person.schema.json",
        "title":"Person",
        "type":"object",
        "properties":{
          "firstName":{
            "type":"string",
            "description":"The person first name."
          },
          "lastName":{
            "type":"string",
            "description":"The person last name."
          },
          "age":{
            "description":"Age in years which must be equal to or greater than zero.",
            "type":"number",
            "minimum":0
          }
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
    "id":"5eb15952155c920013046788",
    "type":"topic",
    "links":{
      "self":"/v2/topics/5eb15952155c920013046788"
    },
    "attributes":{
      "name":"Person",
      "schema":{
        "$id":"https://example.com/person.schema.json",
        "title":"Person",
        "type":"object",
        "properties":{
          "firstName":{
            "type":"string",
            "description":"The person first name."
          },
          "lastName":{
            "type":"string",
            "description":"The person last name."
          },
          "age":{
            "description":"Age in years which must be equal to or greater than zero.",
            "type":"number",
            "minimum":0
          }
        }
      }
    },
    "relationships":{
      "workspace":{
        "data":{
          "id":"5bbf1f5337f655001383e921",
          "type":"workspace"
        },
        "links":{
          "self":"/v2/workspaces/5bbf1f5337f655001383e921"
        }
      },
      "user":{
        "data":{
          "id":"5bbf202b37f655001383e923",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/5bbf202b37f655001383e923"
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/workspace/5bbf1f5337f655001383e921/topic/5eb15952155c920013046788"
  }
}
```

This endpoint allows creating a Topic only by the User that is a member of the Workspace's scope.


### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics`


#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.topic.create` permission.

### Body Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
data.type            | yes      | Allowed value: "topic"
data.attributes.name | yes      | Name of the Topic
data.attributes.schema  | yes | A JSON schema

### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | Workspace ID

### Returns

Returns Topic object if the call succeeded.


## Retrieve Topic by ID

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"5eb15952155c920013046788",
    "type":"topic",
    "links":{
      "self":"/v2/topics/5eb15952155c920013046788"
    },
    "attributes":{
      "name":"Person",
      "schema":{
        "$id":"https://example.com/person.schema.json",
        "title":"Person",
        "type":"object",
        "properties":{
          "firstName":{
            "type":"string",
            "description":"The person first name."
          },
          "lastName":{
            "type":"string",
            "description":"The person last name."
          },
          "age":{
            "description":"Age in years which must be equal to or greater than zero.",
            "type":"number",
            "minimum":0
          }
        }
      }
    },
    "relationships":{
      "workspace":{
        "data":{
          "id":"5bbf1f5337f655001383e921",
          "type":"workspace"
        },
        "links":{
          "self":"/v2/workspaces/5bbf1f5337f655001383e921"
        }
      },
      "user":{
        "data":{
          "id":"5bbf202b37f655001383e923",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/5bbf202b37f655001383e923"
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/workspace/5bbf1f5337f655001383e921/topic/5eb15952155c920013046788"
  }
}
```

This endpoint allows retrieve one Topic by ID.


### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID}`


#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.topic.get` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | Workspace ID
TOPIC_ID | Topic ID

### Returns

Returns Topic object if the call succeeded



## Retrieve all Topics

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id":"5eb15952155c920013046788",
      "type":"topic",
      "links":{
        "self":"/v2/topics/5eb15952155c920013046788"
      },
      "attributes":{
        "name":"Person",
        "schema":{
          "$id":"https://example.com/person.schema.json",
          "title":"Person",
          "type":"object",
          "properties":{
            "firstName":{
              "type":"string",
              "description":"The person first name."
            },
            "lastName":{
              "type":"string",
              "description":"The person last name."
            },
            "age":{
              "description":"Age in years which must be equal to or greater than zero.",
              "type":"number",
              "minimum":0
            }
          }
        }
      },
      "relationships":{
        "workspace":{
          "data":{
            "id":"5bbf1f5337f655001383e921",
            "type":"workspace"
          },
          "links":{
            "self":"/v2/workspaces/5bbf1f5337f655001383e921"
          }
        },
        "user":{
          "data":{
            "id":"5bbf202b37f655001383e923",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/5bbf202b37f655001383e923"
          }
        }
      }
    }
  ],
  "meta":{}
}
```

This endpoint allows to retrieve all Topics.


### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics`


#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.topic.get` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | Workspace ID

### Returns

Returns an array of Topics if the call succeeded.



## Update a Topic

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
  "data":{
    "id": "{TOPIC_ID}"
    "type":"topic",
    "attributes":{
      "name":"Person",
      "schema":{
        "$id":"https://example.com/person.schema.json",
        "title":"Person",
        "type":"object",
        "properties":{
          "firstName":{
            "type":"string",
            "description":"The person first name."
          },
          "lastName":{
            "type":"string",
            "description":"The person last name."
          },
          "middleName":{
            "type":"string",
            "description":"The person middle name."
          },
          "age":{
            "description":"Age in years which must be equal to or greater than zero.",
            "type":"number",
            "minimum":0
          }
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
    "id":"5eb15952155c920013046788",
    "type":"topic",
    "links":{
      "self":"/v2/topics/5eb15952155c920013046788"
    },
    "attributes":{
      "name":"Person",
      "schema":{
        "$id":"https://example.com/person.schema.json",
        "title":"Person",
        "type":"object",
        "properties":{
          "firstName":{
            "type":"string",
            "description":"The person first name."
          },
          "lastName":{
            "type":"string",
            "description":"The person last name."
          },
          "middleName":{
            "type":"string",
            "description":"The person middle name."
          },
          "age":{
            "description":"Age in years which must be equal to or greater than zero.",
            "type":"number",
            "minimum":0
          }
        }
      }
    },
    "relationships":{
      "workspace":{
        "data":{
          "id":"5bbf1f5337f655001383e921",
          "type":"workspace"
        },
        "links":{
          "self":"/v2/workspaces/5bbf1f5337f655001383e921"
        }
      },
      "user":{
        "data":{
          "id":"5bbf202b37f655001383e923",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/5bbf202b37f655001383e923"
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/workspace/5bbf1f5337f655001383e921/topic/5eb15952155c920013046788"
  }
}
```

This endpoint allows updating a Topic only by the User that is a member of the Workspace's scope.


### HTTP Request

`PATCH {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID}`


#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.topic.edit` permission.

### Body Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
data.type            | yes      | Allowed value: "topic"
data.id            | yes      |Topic ID
data.attributes.name | no      | Name of the Topic
data.attributes.schema  | no | A JSON schema

### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | The ID of the Workspace
TOPIC_ID | The ID of the Topic

### Returns

Returns Topic object if the call succeeded




## Delete a Topic

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
 ```


> Example Response:


```http
HTTP/1.1 204 No Content
```

This endpoint allows deleting a Topic.


### HTTP Request

`DELETE {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/topics/{TOPIC_ID}`


#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.topic.delete` permission.

### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | Workspace ID
TOPIC_ID | Topic ID

### Returns

Responds with `204 No content` if the call succeeded (with empty body).
