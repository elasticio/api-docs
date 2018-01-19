# Flow versions

## Retrieve all flow versions

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions?page[size]=20&page[number]=1 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": [
      {
         "type": "flow-version",
         "id": "{VERSION_HASH}",
         "attributes": {
            "created_at": "2017-11-28T15:07:48.566Z",
            "name": "WebHook to Mailchimp",
            "description": "Some real description",
            "cron": "*/3 * * * *",
            "graph": {
               "nodes": [
                  {
                     "id": "step_1",
                     "command": "my_team/webhook:receive",
                     "fields": {
                        "payload": "email,first,last"
                     }
                  },
                  {
                     "id": "step_3",
                     "command": "my_team/mailchimp:subscribe@46d410dd2a64cfc64858ce3d90e015acf531c9b6",
                     "fields": {
                        "listId": "8779dd762e"
                     },
                     "credentials_id": "585918da586224001b96de88",
                     "selected_data_samples": [
                        "54536902230d250700000000"
                     ],
                     "out_data_samples": [
                        "54536902230d250700000000",
                        "54536902230d250700000001"
                     ]
                  }
               ],
               "edges": [
                  {
                     "id": "step_2",
                     "source": "step_1",
                     "target": "step_3",
                     "config": {
                        "mapper_type": "jsonata",
                        "mapper": {
                           "email": "email",
                           "email_type": "\"html\"",
                           "firstName": "first",
                           "lastName": "last"
                        }
                     }
                  }
               ]
            }
         },
         "links": {
            "self": "/v2/flows/{FLOW_ID}/versions/{VERSION_HASH}"
         },
         "relationships": {
            "user": {
               "data": {
                  "type": "user",
                  "id": "{USER_ID}"
               },
               "links": {
                  "self": "/v2/users/{USER_ID}"
               }
            },
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
      }
   ],
   "meta": {
      "page": 1,
      "per_page": 50,
      "total": 1,
      "total_pages": 1
   }
}
```

These versions represent the history of changes of the flow and are sorted chronologically by `created_at`.

Each version has an `id` and represents a flow's state at the given `created_at` time.
It also exposes a relationship to the author of the change.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions`

### URL Parameters

| Parameter      | Required | Description              | Default |
| :------------- | :------- | :----------------------- | :------ |
| FLOW_ID        | Yes      | Flow identifier          |         |
| page\[size\]   | No       | Amount of items per page | 50      |
| page\[number\] | No       | Number of page           | 1       |


### Returns

The list of versions for the specified flow.

## Retrieve flow version by hash

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": {
      "id": "{VERSION_HASH}",
      "type": "flow-version",
      "attributes": {
         "created_at": "2017-11-28T15:07:48.566Z",
         "name": "WebHook to Mailchimp",
         "description": "Some real description",
         "cron": "*/3 * * * *",
         "graph": {
            "nodes": [
               {
                  "id": "step_1",
                  "command": "my_team/webhook:receive",
                  "fields": {
                     "payload": "email,first,last"
                  }
               },
               {
                  "id": "step_3",
                  "command": "my_team/mailchimp:subscribe@46d410dd2a64cfc64858ce3d90e015acf531c9b6",
                  "fields": {
                     "listId": "8779dd762e"
                  },
                  "credentials_id": "585918da586224001b96de88",
                  "selected_data_samples": [
                     "54536902230d250700000000"
                  ],
                  "out_data_samples": [
                     "54536902230d250700000000",
                     "54536902230d250700000001"
                  ]
               }
            ],
            "edges": [
               {
                  "id": "step_2",
                  "source": "step_1",
                  "target": "step_3",
                  "config": {
                     "mapper_type": "jsonata",
                     "mapper": {
                        "email": "email",
                        "email_type": "\"html\"",
                        "firstName": "first",
                        "lastName": "last"
                     }
                  }
               }
            ]
         }
      },
      "links": {
         "self": "/v2/flows/{FLOW_ID}/versions/{VERSION_HASH}"
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
         "flow": {
            "data": {
               "id": "{FLOW_ID}",
               "type": "flow"
            },
            "links": {
               "self": "/v2/flows/{FLOW_ID}"
            }
         }
      }
   }
}
```

This resource allows to you retrieve specific version of the flow by its version hash.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH}`

### URL Parameters

| Parameter    | Required | Description     |
| :----------- | :------- | :-------------- |
| FLOW_ID      | Yes      | Flow identifier |
| VERSION_HASH | Yes      | Version hash    |

### Returns

Specific version of the flow.
