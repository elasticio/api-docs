# Teams

## Retrieve all teams



> Example Request:


```shell
curl {{ api_base_url }}/v2/teams?contract_id={CONTRACT_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id":"5aa7de77a0c086000785c53e",
      "type":"team",
      "links":{
        "self":"/v2/teams/5aa7de77a0c086000785c53e"
      },
      "attributes":{
        "name":"Team_name"
      },
      "relationships":{
        "contract":{
          "data":{
            "id":"59d341e9037f7200184a408b",
            "type":"contract"
          },
          "links":{
            "self":"/v2/contract/59d341e9037f7200184a408b"
          }
        },
        "users":{
          "data":[
            {
              "id":"5a816bebcad2b40007adcaf2",
              "type":"user"
            }
          ]
        },
        "components":{
          "data":[
            {
              "id":"5a96906605f3f60007a76324",
              "type":"component"
            }
          ]
        }
      },
      "meta":{},
      "links":{
        "self":"/v2/teams"
      }
    }
  ]
}
```

This resource allows retrieving all teams where the current user remains a member.

### HTTP Request

`GET {{ api_base_url }}/v2/teams/`

#### Authorization
This request is authorized for a User of a current contract or with `contract.devTeams.get` permission only.

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|contract_id|yes |An Id of the Contract|

### Returns

Returns teams metadata object if the call succeeded.


## Retrieve team by ID

> Example Request:


```shell
curl {{ api_base_url }}/v2/teams/{TEAM_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "id": "5a660b0309949a000716d4db",
        "type": "team",
        "links": {
            "self": "/v2/teams/5a660b0309949a000716d4db"
        },
        "attributes": {
            "name": "2201team"
        },
        "relationships": {
            "contract": {
                "data": {
                    "id": "5b5ed1cf272cf80011ae7b43",
                    "type": "contract"
                },
                "links": {
                    "self": "/v2/contracts/5b5ed1cf272cf80011ae7b43"
                }
            },
            "users": {
                "data": [
                    {
                        "id": "59d22e7eeb865b0018adc248",
                        "type": "user"
                    },
                    {
                        "id": "560e5a27734d480a00000002",
                        "type": "user"
                    },
                    {
                        "id": "59d3562c68ed850019bde27f",
                        "type": "user"
                    }
                ]
            },
            "components": {
                "data": [
                    {
                        "id": "5a81a065fcc9380007322e86",
                        "type": "component"
                    },
                    {
                        "id": "5a6713361231e7000772a9f2",
                        "type": "component"
                    }
                ]
            }
        }
    },
    "meta": {},
    "links": {
        "self": "/v2/teams/5a660b0309949a000716d4db"
    }
}
```

This resource allows retrieving the team by ID where the current user remains a member.

### HTTP Request

`GET {{ api_base_url }}/v2/teams/{TEAM_ID}`

#### Authorization
This request is authorized for a User of a current contract or with `contract.devTeams.get` permission only.

### Returns

Returns team metadata object if the call succeeded.


## Create a team


> Example Request:


```shell
 curl {{ api_base_url }}/v2/teams \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {  
  "data":{  
    "attributes":{  
      "name":"309myteam",
      "docker_registry":{
        "uri":"docker_registry_uri",
        "credentials":{}
      }
    },
    "relationships":{  
      "contract":{  
        "data":{  
          "id":"5b87c916bfeeb2441025c8bb",
          "type":"contract"
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
    "id":"5aabe01bbd6d6400079b45c4",
    "type":"team",
    "links":{
      "self":"/v2/teams/5aabe01bbd6d6433079b45c4"
    },
    "attributes":{
      "name":"309myteam"
    },
    "relationships":{
      "contract":{
        "data":{
          "id":"59d341e9037f72001833408b",
          "type":"contract"
        },
        "links":{
          "self":"/v2/contract/59d341e9037f7200133a408b"
        }
      },
      "users":{
        "data":[
          {
            "id":"59d22e7eeb86533018adc248",
            "type":"user"
          }
        ]
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a new team.

### HTTP Request

`POST {{ api_base_url }}/v2/teams/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``team`` |
| attributes.name | no | A team name. |
| attributes.docker_registry.uri | no | Docker Registry URI |
| attributes.docker_registry.credentials | no | Docker Registry credentials  |
| relationships.contract.data.id | yes | An Id of the contract |
| relationships.contract.data.type | yes | A value must be ``contract``  |

### Authorization
This request is authorized to a user with the `contracts.devTeam.edit` permission.

### Returns

Returns teams metadata object if the call succeeded.


## Update a team


> Example Request:


```shell
 curl {{ api_base_url }}/v2/teams/{TEAM_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {  
  "data":{
    "id": "{TEAM_ID}",
    "type": "team",
    "attributes":{
      "docker_registry":{
        "uri":"docker_registry_uri",
        "credentials":{}
      }
    }
  }
}'
```



> Example Response:

```http
HTTP/1.1 200 Ok
Content-Type: application/json

{
  "data":{
    "id":"5aabe01bbd6d6400079b45c4",
    "type":"team",
    "links":{
      "self":"/v2/teams/5aabe01bbd6d6433079b45c4"
    },
    "attributes":{
      "name":"309myteam"
    },
    "relationships":{
      "contract":{
        "data":{
          "id":"59d341e9037f72001833408b",
          "type":"contract"
        },
        "links":{
          "self":"/v2/contract/59d341e9037f7200133a408b"
        }
      },
      "users":{
        "data":[
          {
            "id":"59d22e7eeb86533018adc248",
            "type":"user"
          }
        ]
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update a new team.

### HTTP Request

`PATCH {{ api_base_url }}/v2/teams/{TEAM_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team identifier |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| id | yes | Team Id must be same as url parameter |
| type | yes | A value must be ``team`` |
| attributes.docker_registry.uri | no | Docker Registry URI |
| attributes.docker_registry.credentials | no | Docker Registry credentials  |

### Authorization
This request is authorized to a user with the `contracts.devTeam.edit` permission.

### Returns

Returns teams metadata object if the call succeeded.


## Add a new member to a team


> Example Request:


```shell
 curl {{ api_base_url }}/v2/teams/{TEAM_ID}/relationships/members \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "data": {
            "type": "user",
            "id": "{USER_ID}"
       }
   }'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"59d3ace74a819c0018e9bb92",
    "type":"team",
    "links":{
      "self":"/v2/teams/59d3ace74a819c0018e9bb92"
    },
    "attributes":{
      "name":"Test_Team"
    },
    "relationships":{
      "contract":{
        "data":{
          "id":"59d22e7eeb865b0018adc247",
          "type":"contract"
        },
        "links":{
          "self":"/v2/contract/59d22e7eeb865b0018adc247"
        }
      },
      "users":{
        "data":[
          {
            "id":"59d22e7eeb865b0018adc248",
            "type":"user"
          },
          {
            "id":"59f747c33f1d3c001901a44e",
            "type":"user"
          },
          {
            "id":"59d3562c68ed850019bde27f",
            "type":"user"
          }
        ]
      }
    }
  },
  "meta":{}
}
```

This resource allows you to add a new member to a team.

### HTTP Request

`POST {{ api_base_url }}/v2/teams/{TEAM_ID}/relationships/members`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team identifier |


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| id | yes | Id of an already registered user, who will be added as a member of the team |

### Authorization

This request is authorized to a user with the `contracts.devTeam.edit` permission.

### Returns

Returns teams metadata object if the call succeeded.


## Remove a member from a team


> Example Request:


```shell
 curl {{ api_base_url }}/v2/teams/{TEAM_ID}/relationships/members \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "data": {
            "type": "user",
            "id": "{user_id}"
       }
   }'
```



> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to remove a member from a team.

### HTTP Request

`DELETE {{ api_base_url }}/v2/teams/{TEAM_ID}/relationships/members`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team identifier |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| id | yes | User identifier |

### Authorization

This request is authorized to a user with the `contracts.devTeam.edit` permission.

### Returns

Returns teams metadata object if the call succeeded.


## Delete a team


> Example Request:


```shell
 curl {{ api_base_url }}/v2/teams/{TEAM_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to delete a team.
You cannot remove team which contains the repos, you should delete all repos first.

### HTTP Request

`DELETE {{ api_base_url }}/v2/teams/{TEAM_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team ID |

### Authorization
This request is authorized to a user with the `contracts.devTeam.edit` permission.

### Returns

Returns empty body




