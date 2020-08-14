# Recipes (Experimental)

 <aside class="warning">
 <b>The Recipes section is an experimental API</b>
 </aside>

## Accessing and sharing recipes

The recipe has an attribute ``visibility``, which indicates how the recipe is shared by other clients. A shared recipe
is available to other users for their Flows. There are four sharing modes:

- ``workspace`` – Only Workspace members can use the recipe.
- ``contract`` – Members of all Contract Workspaces can use the recipe.
- ``tenant`` – Recipe is available to other clients in the tenant.
- ``global`` – Any user of the platform can use these recipes.

Accordingly, a set of recipes available for each user consists of: non-shared recipes from the user's Workspace,
recipes with `contract`, `tenant` and `global` access. When you create a recipe, it has default visibility `workspace`.

*Note:* deleting recipes with `contract`, `tenant` and `global` visibility is forbidden.
*Note:* downgrading recipes visibility is forbidden.
 
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
        "declarations": {
          "variables": [
            {
              "id": "email",
              "title": "Email address",
              "help": {
                "description": "Email to fill a \"CC\" field",
                "link": "http://test.com/recipes/12345"
              }
            }
          ],
          "credentials": [
            {
              "id": "petstore",
              "help": {
                "description": "Credentials to access your Petstore"
              }
            }
          ]
        },
        "info": {
          "title": "My Recipe",
          "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        },
        "flow_templates": [
          {
            "cron": "*/3 * * * *",
            "title": "My first flow template",
            "graph": {
              "nodes": [
                {
                  "id": "step_1",
                  "name": "Step name",
                  "credentials_id": "petstore",
                  "description": "Step description",
                  "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                  "dynamic_metadata": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "step_2",
                  "name": "Step name",
                  "description": "Step description",
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "fields": {
                    "dontThrowErrorFlg": true
                  },
                  "dynamic_select_model": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "error_all",
                  "name": "Error handler",
                  "error": true,
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "data_sample": {
                    "foo": "bar"
                  }
                }
              ],
              "edges": [
                {
                  "config": {
                    "mapper_type": "jsonata",
                    "mapper": {
                      "to": "pets[0].name",
                      "cc": "$getFlowVariables().email",
                      "subject": "pets[0].id",
                      "textBody": "pets[0].status"
                    },
                    "condition": null
                  },
                  "source": "step_1",
                  "target": "step_2"
                },
                {
                  "target": "error_all"
                }
              ]
            }
          }
        ]
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
  }
'
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
        "declarations": {
          "variables": [
            {
              "id": "email",
              "title": "Email address",
              "help": {
                "description": "Email to fill a \"CC\" field",
                "link": "http://test.com/recipes/12345"
              }
            }
          ],
          "credentials": [
            {
              "id": "petstore",
              "help": {
                "description": "Credentials to access your Petstore"
              }
            }
          ]
        },
        "info": {
          "title": "My Recipe",
          "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        },
        "flow_templates": [
          {
            "cron": "*/3 * * * *",
            "title": "My first flow template",
            "graph": {
              "nodes": [
                {
                  "id": "step_1",
                  "name": "Step name",
                  "credentials_id": "petstore",
                  "description": "Step description",
                  "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                  "dynamic_metadata": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "step_2",
                  "name": "Step name",
                  "description": "Step description",
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "fields": {
                    "dontThrowErrorFlg": true
                  },
                  "dynamic_select_model": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "error_all",
                  "name": "Error handler",
                  "error": true,
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "data_sample": {
                    "foo": "bar"
                  }
                }
              ],
              "edges": [
                {
                  "config": {
                    "mapper_type": "jsonata",
                    "mapper": {
                      "to": "pets[0].name",
                      "cc": "$getFlowVariables().email",
                      "subject": "pets[0].id",
                      "textBody": "pets[0].status"
                    },
                    "condition": null
                  },
                  "source": "step_1",
                  "target": "step_2"
                },
                {
                  "target": "error_all"
                }
              ]
            }
          }
        ]
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
  }
'
```

> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data": {
    "id": "{RECIPE_ID}",
    "type": "recipe",
    "visibility": "workspace",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "declarations": {
        "variables": [
          {
            "id": "email",
            "title": "Email address",
            "help": {
              "description": "Email to fill a \"CC\" field",
              "link": "http://test.com/recipes/12345"
            }
          }
        ],
        "credentials": [
          {
            "id": "petstore",
            "help": {
              "description": "Credentials to access your Petstore"
            }
          }
        ]
      },
      "info": {
        "title": "My Recipe",
        "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      "flow_templates": [
        {
          "cron": "*/3 * * * *",
          "title": "My first flow template",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "name": "Step name",
                "credentials_id": "petstore",
                "description": "Step description",
                "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                "dynamic_metadata": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "step_2",
                "name": "Step name",
                "description": "Step description",
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "dynamic_select_model": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "error_all",
                "name": "Error handler",
                "error": true,
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "data_sample": {
                  "foo": "bar"
                }
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "$getFlowVariables().email",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              },
              {
                "target": "error_all"
              }
            ]
          }
        }
      ]
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
      },
      "contract": {
        "data": {
          "id": "{CONTRACT_ID}",
          "type": "contract"
        },
        "links": {
          "self": "/v2/contracts/{CONTRACT_ID}"
        }
      }
    }
  }
}

```

This resource allows you to create a new recipe.

### HTTP Request

`POST {{ api_base_url }}/v2/recipes/`

### Body Parameters

| Parameter                                        | Required | Description  |
| :----------------------------------------------- | :------- | :----------- |
| type                                             | yes      | A value must be `recipe`|
| attributes.declarations.variables                | no       | List of variables used by steps in a flow |
| attributes.declarations.credentials              | no       | List of credentials used by steps in a flow |
| attributes.info.name                             | yes      | Recipe name|
| attributes.info.description                      | yes      | Recipe description |
| attributes.info.short_description                | yes      | Recipe short description  |
| attributes.flow_templates[].title                | yes       | Flow template title  |
| attributes.flow_templates[].cron                 | no       | Cron expression  |
| attributes.flow_templates[].graph                | yes      | Recipe graph representing component connections  |
| relationships.workspace.data.id                  | yes      | An Id of the Workspace  |
| relationships.workspace.data.type                | yes      | A value must be `workspace` |

### Authorization

This request is authorized to only a user with `workspaces.recipe.edit` permission

### Returns

Returns the created recipe

**Note:** you can use `$getFlowVariables().{variable_name}` only in `attributes.flow_template.edges.config.mapper` section. Variable value will be defined by recipe user during activation. 

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
    "visibility": "workspace",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "declarations": {
        "variables": [
          {
            "id": "email",
            "title": "Email address",
            "help": {
              "description": "Email to fill a \"CC\" field",
              "link": "http://test.com/recipes/12345"
            }
          }
        ],
        "credentials": [
          {
            "id": "petstore",
            "help": {
              "description": "Credentials to access your Petstore"
            }
          }
        ]
      },
      "info": {
        "title": "My Recipe",
        "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      "flow_templates": [
        {
          "cron": "*/3 * * * *",
          "title": "My first flow template",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "name": "Step name",
                "credentials_id": "petstore",
                "description": "Step description",
                "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                "dynamic_metadata": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "step_2",
                "name": "Step name",
                "description": "Step description",
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "dynamic_select_model": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "error_all",
                "name": "Error handler",
                "error": true,
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "data_sample": {
                  "foo": "bar"
                }
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "$getFlowVariables().email",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              },
              {
                "target": "error_all"
              }
            ]
          }
        }
      ]
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
      },
      "contract": {
        "data": {
          "id": "{CONTRACT_ID}",
          "type": "contract"
        },
        "links": {
          "self": "/v2/contracts/{CONTRACT_ID}"
        }
      }
    }
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
    "visibility": "workspace",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "declarations": {
        "variables": [
          {
            "id": "email",
            "title": "Email address",
            "help": {
              "description": "Email to fill a \"CC\" field",
              "link": "http://test.com/recipes/12345"
            }
          }
        ],
        "credentials": [
          {
            "id": "petstore",
            "help": {
              "description": "Credentials to access your Petstore"
            }
          }
        ]
      },
      "info": {
        "title": "My Recipe",
        "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      "flow_templates": [
        {
          "cron": "*/3 * * * *",
          "title": "My first flow template",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "name": "Step name",
                "credentials_id": "petstore",
                "description": "Step description",
                "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                "dynamic_metadata": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "step_2",
                "name": "Step name",
                "description": "Step description",
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "dynamic_select_model": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "error_all",
                "name": "Error handler",
                "error": true,
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "data_sample": {
                  "foo": "bar"
                }
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "$getFlowVariables().email",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              },
              {
                "target": "error_all"
              }
            ]
          }
        }
      ]
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
      },
      "contract": {
        "data": {
          "id": "{CONTRACT_ID}",
          "type": "contract"
        },
        "links": {
          "self": "/v2/contracts/{CONTRACT_ID}"
        }
      }
    }
  }
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
curl '{{ api_base_url }}/v2/recipes?workspace_id={WORKSPACE_ID}&page[size]=2&page[number]=1' \
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
      "visibility": "workspace",
      "links": {
        "self": "/v2/recipes/{RECIPE_ID}"
      },
      "attributes": {
        "declarations": {
          "variables": [
            {
              "id": "email",
              "title": "Email address",
              "help": {
                "description": "Email to fill a \"CC\" field",
                "link": "http://test.com/recipes/12345"
              }
            }
          ],
          "credentials": [
            {
              "id": "petstore",
              "help": {
                "description": "Credentials to access your Petstore"
              }
            }
          ]
        },
        "info": {
          "title": "My Recipe",
          "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
          "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        },
        "flow_templates": [
          {
            "cron": "*/3 * * * *",
            "title": "My first flow template",
            "graph": {
              "nodes": [
                {
                  "id": "step_1",
                  "name": "Step name",
                  "credentials_id": "petstore",
                  "description": "Step description",
                  "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                  "dynamic_metadata": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "step_2",
                  "name": "Step name",
                  "description": "Step description",
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "fields": {
                    "dontThrowErrorFlg": true
                  },
                  "dynamic_select_model": {
                    "field": "value"
                  },
                  "data_sample": {
                    "foo": "bar"
                  }
                },
                {
                  "id": "error_all",
                  "name": "Error handler",
                  "error": true,
                  "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                  "data_sample": {
                    "foo": "bar"
                  }
                }
              ],
              "edges": [
                {
                  "config": {
                    "mapper_type": "jsonata",
                    "mapper": {
                      "to": "pets[0].name",
                      "cc": "$getFlowVariables().email",
                      "subject": "pets[0].id",
                      "textBody": "pets[0].status"
                    },
                    "condition": null
                  },
                  "source": "step_1",
                  "target": "step_2"
                },
                {
                  "target": "error_all"
                }
              ]
            }
          }
        ]
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
        },
        "contract": {
          "data": {
            "id": "{CONTRACT_ID}",
            "type": "contract"
          },
          "links": {
            "self": "/v2/contracts/{CONTRACT_ID}"
          }
        }
      }
    }
  ],
  "meta": {
    "page": 1,
    "per_page": 1,
    "total": 16,
    "total_pages": 16
  }
}
```

This resource allows you to retrieve all recipes.

### HTTP Request

`GET {{ api_base_url }}/v2/recipes/`

### Query Parameters

| Parameter         | Required  | Description                                         |
| :---              | :---      | :---                                                |
| workspace_id      | yes       | An Id of the Workspace                              |
| page[size]        | no        | Amount of items per page. Default is `50`.          |
| page[number]      | no        | Number of page you want to display. Default is `1`. |

### Returns

Returns all recipes which are available in the specified Workspace.

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
           "title": "My Recipe",
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
                 "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@latest",
                 "id": "step_1"
               },
               {
                 "name": "New name",
                 "description": "New description",
                 "command": "{{ repo_name }}/email:send@latest",
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
                     "cc": "$getFlowVariables().emailCc",
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
    "visibility": "workspace",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "declarations": {
        "variables": [
          {
            "id": "email",
            "title": "Email address",
            "help": {
              "description": "Email to fill a \"CC\" field",
              "link": "http://test.com/recipes/12345"
            }
          }
        ],
        "credentials": [
          {
            "id": "petstore",
            "help": {
              "description": "Credentials to access your Petstore"
            }
          }
        ]
      },
      "info": {
        "title": "My Recipe",
        "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      "flow_templates": [
        {
          "cron": "*/3 * * * *",
          "title": "My first flow template",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "name": "Step name",
                "credentials_id": "petstore",
                "description": "Step description",
                "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                "dynamic_metadata": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "step_2",
                "name": "Step name",
                "description": "Step description",
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "dynamic_select_model": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "error_all",
                "name": "Error handler",
                "error": true,
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "data_sample": {
                  "foo": "bar"
                }
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "$getFlowVariables().email",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              },
              {
                "target": "error_all"
              }
            ]
          }
        }
      ]
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
      },
      "contract": {
        "data": {
          "id": "{CONTRACT_ID}",
          "type": "contract"
        },
        "links": {
          "self": "/v2/contracts/{CONTRACT_ID}"
        }
      }
    }
  }
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
| attributes.declarations.credentials              | no       | List of credentials used by steps in a flow                        |
| attributes.declarations.variables                | no       | List of variables used by steps in a flow                          |
| attributes.info.name                             | no       | Recipe name                                                        |
| attributes.info.description                      | no       | Recipe description                                                 |
| attributes.info.short_description                | no       | Recipe short description                                           |
| attributes.flow_templates[].cron                 | no       | Cron expression                                                    |
| attributes.flow_templates[].graph                | yes      | Recipe graph representing component connections                    |
| relationships.workspace.data.id                  | yes      | MUST be the same as the {RECIPE_ID}                                |
| relationships.workspace.data.type                | yes      | A value must be `workspace`                                        |

### Authorization

This request is authorized for a user with the `workspaces.recipe.edit` permission.

### Returns

Returns the updated recipe

## Update a recipe visibility

> Example request

```shell
curl {{ api_base_url }}/v2/recipes/{RECIPE_ID}/visibility \
  -X PATCH \
  -u {EMAIL}:{APIKEY} \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' -d '
   {
     "data": {
       "visibility": "contract"
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
    "visibility": "contract",
    "links": {
      "self": "/v2/recipes/{RECIPE_ID}"
    },
    "attributes": {
      "declarations": {
        "variables": [
          {
            "id": "email",
            "title": "Email address",
            "help": {
              "description": "Email to fill a \"CC\" field",
              "link": "http://test.com/recipes/12345"
            }
          }
        ],
        "credentials": [
          {
            "id": "petstore",
            "help": {
              "description": "Credentials to access your Petstore"
            }
          }
        ]
      },
      "info": {
        "title": "My Recipe",
        "description": "# Scelerisque eleifend donec pretium vulputate sapien. \n\n ## Tincidunt id aliquet risus feugiat. \n\nA condimentum vitae sapien pellentesque habitant morbi tristique senectus et. **Nec feugiat in fermentum posuere urna**.",
        "short_description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      "flow_templates": [
        {
          "cron": "*/3 * * * *",
          "title": "My first flow template",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "name": "Step name",
                "credentials_id": "petstore",
                "description": "Step description",
                "command": "{{ repo_name }}/petstore:getPetsByStatusWithGenerators@bfa02ebf35383d98e2099b0a791a755a",
                "dynamic_metadata": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "step_2",
                "name": "Step name",
                "description": "Step description",
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "fields": {
                  "dontThrowErrorFlg": true
                },
                "dynamic_select_model": {
                  "field": "value"
                },
                "data_sample": {
                  "foo": "bar"
                }
              },
              {
                "id": "error_all",
                "name": "Error handler",
                "error": true,
                "command": "{{ repo_name }}/email:send@bfa02ebf35383d98e2099b0a791a755a",
                "data_sample": {
                  "foo": "bar"
                }
              }
            ],
            "edges": [
              {
                "config": {
                  "mapper_type": "jsonata",
                  "mapper": {
                    "to": "pets[0].name",
                    "cc": "$getFlowVariables().email",
                    "subject": "pets[0].id",
                    "textBody": "pets[0].status"
                  },
                  "condition": null
                },
                "source": "step_1",
                "target": "step_2"
              },
              {
                "target": "error_all"
              }
            ]
          }
        }
      ]
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
      },
      "contract": {
        "data": {
          "id": "{CONTRACT_ID}",
          "type": "contract"
        },
        "links": {
          "self": "/v2/contracts/{CONTRACT_ID}"
        }
      }
    }
  }
}
```

This resource allows you to update attribute visibility of the given recipe.

### HTTP Request

`PATCH {{ api_base_url }}/v2/recipes/{RECIPE_ID}/visibility`

### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| RECIPE_ID | yes      | Recipe ID   |

### Body Parameters

| Parameter    | Required | Description                                                                              |
| :------------| :------- | :--------------------------------------------------------------------------------------- |
| visibility   | yes      | Recipe sharing mode. Value must be one of `workspace`, `contract`, `tenant` or `global`  |

### Authorization

This request is authorized depend on specified visibility level for a user that has next permission:

- to `tenant` if user has permission `tenant.recipe.edit_visibility_tenant`

- to `global` if user has permission `global.recipe.edit_visibility_global`

- to `contract` if user has permission `workspaces.recipe.edit`

- to `workspace` if user has permission `workspaces.recipe.edit`


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
         "credentials": {
           "step_1": "{CREDENTIAL_ID}"
         },
         "variables": {
           "TO_EMAIL": "goose@example.com",
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
| attributes.variables              | yes      | Specify values for variables which were defined in Recipe for mapping           |
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
HTTP/1.1 204 Ok
```
