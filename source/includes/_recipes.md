# Recipes (Experimental)

 <aside class="warning">
 <b>The Recipes section is an experimental API</b>
 </aside>

## Create a recipe

> Example Request (without required trigger/action fields):

```shell
curl -X POST {{ api_base_url }}/v2/recipes \
  -u {EMAIL}:{APIKEY} \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' -d '
  {
    "data": {
      "type": "recipe",
      "attributes": {
        "activation_config": {
          "variables": [{
            "title": "Email to fill a \"CC\" field",
            "key": "cc"
          }],
          "credentials": [{
            "description": "Credentials to access your Petstore",
            "stepId": "step_1"
          }]
        },
        "marketplace_content": {
          "title": "My first recipe 2nd iteration",
          "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "help_text": "No setup required",
          "tags": []
        },
        "flow_template": {
          "cron": "*/3 * * * *",
          "graph": {
            "nodes": [
              {
                "name": "Step name",
                "description": "Step description",
                "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
                "id": "step_1"
              },
              {
                "name": "Step name",
                "description": "Step description",
                "command": "elasticio/email:send@latest",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "id": "step_2"
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "vars.cc",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              }
            ]
          }
        }
      },
      "relationships": {
        "workspace": {
          "data": {
            "type": "workspace",
            "id": "{WORKSPACE_ID}"
          }
        }
      }
    }
  }'
```

> Example Request (with required trigger/action fields):

```shell
curl -X POST {{ api_base_url }}/v2/recipes \
  -u {EMAIL}:{APIKEY} \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' -d '
  {
    "data": {
      "type": "recipe",
      "attributes": {
        "activation_config": {
          "variables": [{
            "title": "Email to fill a \"CC\" field",
            "key": "cc"
          }],
          "credentials": [{
            "description": "Credentials to access your Petstore",
            "stepId": "step_1"
          }]
        },
        "marketplace_content": {
          "title": "My first recipe 2nd iteration",
          "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "help_text": "No setup required",
          "tags": []
        },
        "flow_template": {
          "cron": "*/3 * * * *",
          "graph": {
            "nodes": [
              {
                "name": "Step name",
                "description": "Step description",
                "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
                "fields": {
                  "status": "pending"
                },
                "id": "step_1"
              },
              {
                "name": "Step name",
                "description": "Step description",
                "command": "elasticio/email:send@latest",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "id": "step_2"
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "vars.cc",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              }
            ]
          }
        }
      },
      "relationships": {
        "workspace": {
          "data": {
            "type": "workspace",
            "id": "{WORKSPACE_ID}"
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
  "data": {
    "id": "{RECIPE_ID}",
    "type": "recipe",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "activation_config": {
        "variables": [{
          "title": "Email to fill a \"CC\" field",
          "key": "cc"
        }],
        "credentials": [{
          "description": "Credentials to access your Petstore",
          "stepId": "step_1"
        }]
      },
      "marketplace_content": {
        "title": "My first recipe 2nd iteration",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "help_text": "No setup required",
        "tags": []
      },
      "flow_template": {
        "cron": "*/3 * * * *",
        "graph": {
          "edges": [
            {
              "config": {
                "condition": null,
                "mapper": {
                  "textBody": "pets[0].status",
                  "subject": "pets[0].id",
                  "to": "pets[0].name",
                  "cc": "vars.cc"
                },
                "mapper_type": "jsonata"
              },
              "source": "step_1",
              "target": "step_2"
            }
          ],
          "nodes": [
            {
              "name": "Step name",
              "description": "Step description",
              "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
              "id": "step_1"
            },
            {
              "name": "Step name",
              "description": "Step description",
              "command": "elasticio/email:send@latest",
              "fields": {
                "dontThrowErrorFlg": true
              },
              "id": "step_2"
            }
          ]
        }
      },
      "created_at": "2019-09-30T11:22:19.822Z",
      "updated_at": "2019-09-30T11:22:19.822Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to create a new recipe.

### HTTP Request

`POST {{ api_base_url }}/v2/recipes/`

### Body Parameters

| Parameter                                        | Required | Description                                                      |
| :----------------------------------------------- | :------- | :--------------------------------------------------------------- |
| type                                             | yes      | A value must be `recipe`                                         |
| attributes.activation_config.variables           | no       | List of variables used by steps in a flow                        |
| attributes.activation_config.credentials         | no       | List of credentials used by steps in a flow                      |
| attributes.marketplace_content.name              | yes      | Recipe name                                                      |
| attributes.marketplace_content.description       | yes      | Recipe description                                               |
| attributes.marketplace_content.short_description | yes      | Recipe short description                                         |
| attributes.marketplace_content.help_text         | no       | Recipe help text                                                 |
| attributes.flow_template.cron                    | no       | Cron expression                                                  |
| attributes.flow_template.graph                   | yes      | Recipe graph representing component connections                  |
| relationships.workspace.data.id                  | yes      | An Id of the Workspace                                           |
| relationships.workspace.data.type                | yes      | A value must be `workspace`                                      |

### Authorization

This request is authorized to only a user with `workspaces.recipe.edit` permission

### Returns

Returns the created recipe

## Create a recipe from existing flow

> Example Request:

```shell
curl -X POST {{ api_base_url }}/v2/flows/{FLOW_ID}/export-to-recipe \
  -u {EMAIL}:{APIKEY} \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' -d '
  {
    "data": {
      "type": "flow-export-to-recipe-config",
      "relationships": {
        "workspace": {
          "data": {
            "type": "workspace",
            "id": "{WORKSPACE_ID}"
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
  "data": {
    "id": "{RECIPE_ID}",
    "type": "recipe",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "activation_config": {
        "credentials": [{
          "description": "",
          "stepId": "step_1"
        }]
      },
      "marketplace_content": {
        "title": "Recipe based on the flow 'My flow'",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "help_text": "Recipe based on the flow 'My flow'",
        "tags": []
      },
      "flow_template": {
        "cron": "*/3 * * * *",
        "graph": {
          "edges": [
            {
              "config": {
                "condition": null,
                "mapper": {
                  "textBody": "pets[0].status",
                  "subject": "pets[0].id",
                  "to": "pets[0].name",
                  "cc": "cc"
                },
                "mapper_type": "jsonata"
              },
              "source": "step_1",
              "target": "step_2"
            }
          ],
          "nodes": [
            {
              "name": "Step name",
              "description": "Step description",
              "command": "elasticio/petstore:getPetsByStatusWithGenerators@1eb65b1721c45e746c25d64e3ab85888f18f31c5",
              "id": "step_1"
            },
            {
              "name": "Step name",
              "description": "Step description",
              "command": "elasticio/email:send@3746623b98821a291fb1e132f1278978c5f98f9b",
              "fields": {
                "dontThrowErrorFlg": true
              },
              "id": "step_2"
            }
          ]
        }
      },
      "created_at": "2019-09-30T11:22:19.822Z",
      "updated_at": "2019-09-30T11:22:19.822Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to export an existing flow as a new recipe.

### HTTP Request

`POST {{ api_base_url }}/v2/flows/{FLOW_ID}/export-to-recipe`

### Body Parameters

| Parameter                         | Required | Description                                                                     |
| :-------------------------------- | :------- | :------------------------------------------------------------------------------ |
| type                              | yes      | A value must be `flow-export-to-recipe-config`                                  |
| relationships.workspace.data.id   | yes      | An Id of the Workspace                                                          |
| relationships.workspace.data.type | yes      | A value must be `workspace`                                                     |

### Authorization

This request is authorized to only a user with `workspaces.recipe.edit` permission

### Returns

Returns the created recipe

## Retrieve a recipe by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/recipes/{RECIPE_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "id": "{RECIPE_ID}",
    "type": "recipe",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "activation_config": {
        "variables": [{
          "title": "Email to fill a \"CC\" field",
          "key": "cc"
        }],
        "credentials": [{
          "description": "Credentials to access your Petstore",
          "stepId": "step_1"
        }]
      },
      "marketplace_content": {
        "title": "My first recipe 2nd iteration",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "help_text": "No setup required",
        "tags": []
      },
      "flow_template": {
        "graph": {
          "edges": [
            {
              "config": {
                "mapper_type": "jsonata",
                "mapper": {
                  "to": "pets[0].name",
                  "subject": "pets[0].id",
                  "textBody": "pets[0].status",
                  "cc": "vars.cc"
                },
                "condition": null
              },
              "source": "step_1",
              "target": "step_2"
            }
          ],
          "nodes": [
            {
              "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
              "id": "step_1"
            },
            {
              "command": "elasticio/email:send@latest",
              "fields": {
                "dontThrowErrorFlg": true
              },
              "id": "step_2"
            }
          ]
        }
      },
      "created_at": "2019-09-29T11:22:19.822Z",
      "updated_at": "2019-09-30T11:22:19.822Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to retrieve a recipe by its ID.

### HTTP Request

`GET {{ api_base_url }}/v2/recipes/{RECIPE_ID}`

### URL Parameters

| Parameter | Required | Description       |
| :-------- | :------- | :---------------- |
| RECIPE_ID | Yes      | Recipe identifier |

### Authorization

This request is authorized to a member of the corresponding contract only.

### Returns

The recipe with given ID

## Retrieve all recipes

> Example Request (with custom paging):

```shell
curl '{{ api_base_url }}/v2/recipes?contract_id={CONTRACT_ID}&page[size]=2&page[number]=1' \
   -g -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "{RECIPE_ID}",
      "type": "recipe",
      "links": {
        "self": "/v2/recipes/{RECIPE_ID}"
      },
      "attributes": {
        "activation_config": {
          "variables": [{
            "title": "Email to fill a \"CC\" field",
            "key": "cc"
          }],
          "credentials": [{
            "description": "Credentials to access your Petstore",
            "stepId": "step_1"
          }]
        },
        "marketplace_content": {
          "title": "My first recipe",
          "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "help_text": "No setup required",
          "tags": []
        },
        "flow_template": {
          "graph": {
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "vars.cc",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              }
            ],
            "nodes": [
              {
                "command": "elasticio/petstore:getPetsByStatusWithGenerators@7edfbaba2e7457b7d4413dcbfd9e4fa7991c0a1a",
                "fields": {
                  "status": "pending"
                },
                "id": "step_1"
              },
              {
                "command": "elasticio/email:send@b9f4e1483c964e0c2fe6f7600ffe81b6aca8ef33",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "id": "step_2"
              }
            ]
          }
        },
        "created_at": "2019-09-29T11:22:19.822Z",
        "updated_at": "2019-09-29T11:22:19.822Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "{USER_ID}",
            "type": "user"
          },
          "links": {
            "self": "/v2/users/{USER_ID}"
          }
        },
        "workspace": {
          "data": {
            "id": "{WORKSPACE_ID}",
            "type": "workspace"
          },
          "links": {
            "self": "/v2/workspaces/{WORKSPACE_ID}"
          }
        }
      }
    },
    {
      "id": "{RECIPE_ID}",
      "type": "recipe",
      "links": {
        "self": "/v2/recipes/{RECIPE_ID}"
      },
      "attributes": {
        "activation_config": {
          "variables": [{
            "title": "Email to fill a \"CC\" field",
            "key": "cc"
          }],
          "credentials": [{
            "description": "Credentials to access your Petstore",
            "stepId": "step_1"
          }]
        },
        "marketplace_content": {
          "title": "My second recipe",
          "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "help_text": "No setup required",
          "tags": []
        },
        "flow_template": {
          "graph": {
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "vars.cc",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              }
            ],
            "nodes": [
              {
                "command": "elasticio/petstore:getPetsByStatusWithGenerators@7edfbaba2e7457b7d4413dcbfd9e4fa7991c0a1a",
                "fields": {
                  "status": "pending"
                },
                "id": "step_1"
              },
              {
                "command": "elasticio/email:send@b9f4e1483c964e0c2fe6f7600ffe81b6aca8ef33",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "id": "step_2"
              }
            ]
          }
        },
        "created_at": "2019-09-30T11:22:19.822Z",
        "updated_at": "2019-09-30T11:22:19.822Z
      },
      "relationships": {
        "user": {
          "data": {
            "id": "{USER_ID}",
            "type": "user"
          },
          "links": {
            "self": "/v2/users/{USER_ID}"
          }
        },
        "workspace": {
          "data": {
            "id": "{WORKSPACE_ID}",
            "type": "workspace"
          },
          "links": {
            "self": "/v2/workspaces/{WORKSPACE_ID}"
          }
        }
      }
    }
  ],
  "meta": {
    "page": 1,
    "per_page": 2,
    "total": 16,
    "total_pages": 8
  }
}
```

This resource allows you to retrieve all recipes.

### HTTP Request

`GET {{ api_base_url }}/v2/recipes/`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|contract_id|yes| An Id of the Contract is required for the first iteration (until private/public recipes will be introduced)|
| page[size]        | no | Amount of items per page. Default is `50`. |
| page[number]      | no | Number of page you want to display. Default is `1`. |

### Returns

Returns all recipes in the specified Contract.

## Update a recipe

> Example request

```shell
curl {{ api_base_url }}/v2/recipes/{RECIPE_ID} \
  -X PATCH \
  -u {EMAIL}:{APIKEY} \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' -d '
   {
     "data": {
       "id": "{RECIPE_ID}",
       "type": "recipe",
       "attributes": {
         "activation_config": {
           "variables": [{
             "title": "Email to fill a \"CC\" field",
             "key": "emailCc"
           }]
         },
         "marketplace_content": {
           "title": "My first recipe 2nd iteration NEW",
           "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
           "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
           "help_text": "No setup required",
           "tags": []
         },
         "flow_template": {
           "cron": "*/3 * * * *",
           "graph": {
             "nodes": [
               {
                 "name": "New name",
                 "description": "New description",
                 "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
                 "id": "step_1"
               },
               {
                 "name": "New name",
                 "description": "New description",
                 "command": "elasticio/email:send@latest",
                 "fields": {
                   "dontThrowErrorFlg": true
                 },
                 "id": "step_2"
               }
             ],
             "edges": [
               {
                 "config": {
                   "mapper_type": "jsonata",
                   "mapper": {
                     "to": "pets[0].name",
                     "cc": "vars.emailCc",
                     "subject": "pets[0].id",
                     "textBody": "pets[0].status"
                   },
                   "condition": null
                 },
                 "source": "step_1",
                 "target": "step_2"
               }
             ]
           }
         }
       }
     }
   }'
```

> Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "id": "{RECIPE_ID}",
    "type": "recipe",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "activation_config": {
        "variables": [{
          "title": "Email to fill a \"CC\" field",
          "key": "emailCc"
        }],
        "credentials": [{
          "description": "Credentials to access your Petstore",
          "stepId": "step_1"
        }]
      },
      "marketplace_content": {
        "title": "My first recipe 2nd iteration NEW",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "help_text": "No setup required",
        "tags": []
      },
      "flow_template": {
        "cron": "*/3 * * * *",
        "graph": {
          "edges": [
            {
              "config": {
                "condition": null,
                "mapper": {
                  "textBody": "pets[0].status",
                  "subject": "pets[0].id",
                  "to": "pets[0].name",
                  "cc": "vars.emailCc"
                },
                "mapper_type": "jsonata"
              },
              "source": "step_1",
              "target": "step_2"
            }
          ],
          "nodes": [
            {
              "name": "New name",
              "description": "New description",
              "command": "elasticio/petstore:getPetsByStatusWithGenerators@latest",
              "id": "step_1"
            },
            {
              "name": "New name",
              "description": "New description",
              "command": "elasticio/email:send@latest",
              "fields": {
                "dontThrowErrorFlg": true
              },
              "id": "step_2"
            }
          ]
        }
      },
      "created_at": "2019-09-30T11:22:19.822Z",
      "updated_at": "2019-09-30T11:22:19.822Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    }
  },
  "meta": {}
}
```

This resource allows you to update the given recipe.

### HTTP Request

`PATCH {{ api_base_url }}/v2/recipes/{RECIPE_ID}`

### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| RECIPE_ID | yes      | Recipe ID   |

### Body Parameters

| Parameter                                        | Required | Description                                                        |
| :----------------------------------------------- | :------- | :----------------------------------------------------------------- |
| type                                             | yes      | A value must be `recipe`                                           |
| attributes.activation_config.credentials         | no       | List of credentials used by steps in a flow                        |
| attributes.activation_config.variables           | no       | List of variables used by steps in a flow                          |
| attributes.marketplace_content.name              | no       | Recipe name                                                        |
| attributes.marketplace_content.description       | no       | Recipe description                                                 |
| attributes.marketplace_content.short_description | no       | Recipe short description                                           |
| attributes.marketplace_content.help_text         | no       | Recipe help text                                                   |
| attributes.flow_template.cron                    | no       | Cron expression                                                    |
| attributes.flow_template.graph                   | yes      | Recipe graph representing component connections                    |
| relationships.workspace.data.id                  | yes      | MUST be the same as the {RECIPE_ID}                                |
| relationships.workspace.data.type                | yes      | A value must be `workspace`                                        |

### Authorization

This request is authorized for a user with the `workspaces.recipe.edit` permission.

### Returns

Returns the updated recipe

## Activate a recipe

> Example request

```shell
curl {{ api_base_url }}/v2/recipes/{RECIPE_ID}/activate \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
     "data": {
       "type": "recipe-activation-config",
       "attributes": {
         "name": "Flow, created from Recipe",
         "credentials": {
           "step_1": "{CREDENTIAL_ID}"
         },
         "variables": {
           "TO_EMAIL": "goose@elastic.io",
           "NAME_IN_SUBJECT": "Neochen Jubata"
         }
       },
       "relationships": {
         "workspace": {
           "data": {
             "type": "workspace",
             "id": "{WORKSPACE_ID}"
           }
         }
       }
     }
   }'
```

> Example response

```http
HTTP/1.1 201 Created
{
  "data": {
    "relationships": {
      "flow": {
        "data": {
          "type": "flow",
          "id": "{FLOW_ID}"
        },
        "links": {
          "self": "/v2/flows/{FLOW_ID}"
        }
      }
    }
  },
  "meta": {}
}
```

Create a flow from a recipe. If the recipe contains a component, which requires a credential, it should be provided among the request payload.

### HTTP Request

`POST {{ api_base_url }}/v2/recipes/{RECIPE_ID}/activate`

### URL Parameters

| Parameter | Required | Description       |
| :-------- | :------- | :---------------- |
| RECIPE_ID | Yes      | Recipe identifier |


### Body Parameters

| Parameter                         | Required | Description                                                                     |
| :-------------------------------- | :------- | :------------------------------------------------------------------------------ |
| type                              | yes      | A value must be `recipe-activation-config`                                      |
| attributes.name                   | yes      | Flow name                                                                       |
| attributes.credentials            | no       | Specify component credentials if needed                                         |
| attributes.variables              | no       | Specify values for variables which were defined in Recipe for mapping           |
| relationships.workspace.data.id   | yes      | An Id of the Workspace                                                          |
| relationships.workspace.data.type | yes      | A value must be `workspace`                                                     |

### Authorization

This request is authorized for a user with the `workspaces.flow.edit` permission.

### Returns

Returns an ID of created Flow

## Delete a recipe

> Example Request:

```shell
curl {{ api_base_url }}/v2/recipes/{RECIPE_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```

This resource allows you to delete a recipe.

### HTTP Request

`DELETE {{ api_base_url }}/v2/recipe/{RECIPE_ID}`

### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| RECIPE_ID   | yes    | Recipe ID   |

> Example Response:

```http
HTTP/1.1 200 Ok
{
  "data": null,
  "meta": {
    "unlinked_flows": [

    ]
  }
}
```
