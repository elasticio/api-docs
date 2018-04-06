#Teams

## Retrieve all teams


> Example Request:


```shell
curl https://api.elastic.io/v2/teams/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": [
   {
            "id": "5aa7de77a0c086000785c53e",
            "type": "team",
            "links": {
                "self": "/v2/teams/5aa7de77a0c086000785c53e"
            },
            "attributes": {
                "name": "Team_name"
            },
            "relationships": {
                "organization": {
                    "data": {
                        "id": "59d341e9037f7200184a408b",
                        "type": "organization"
                    },
                    "links": {
                        "self": "/v2/organizations/59d341e9037f7200184a408b"
                    }
                },
                "users": {
                    "data": [
                        {
                            "id": "5a816bebcad2b40007adcaf2",
                            "type": "user"
                        },
                        //...
                    ]
                }
            }
        },
        //...
    ],
    "meta": {},
    "links": {
        "self": "/v2/teams"
    }
}
```

This resource allows you to retrieve all teams the current user is member in.

### HTTP Request

`GET https://api.elastic.io/v2/teams/`


### Returns

Returns teams metadata object if the call succeeded.


## Create a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "data": {
            "attributes": {
                "name": "myteam"
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
        "id": "5aabe01bbd6d6400079b45c4",
        "type": "team",
        "links": {
            "self": "/v2/teams/5aabe01bbd6d6400079b45c4"
        },
        "attributes": {
            "name": "1503myteam"
        },
        "relationships": {
            "organization": {
                "data": {
                    "id": "59d341e9037f7200184a408b",
                    "type": "organization"
                },
                "links": {
                    "self": "/v2/organizations/59d341e9037f7200184a408b"
                }
            },
            "users": {
                "data": [
                    {
                        "id": "59d22e7eeb865b0018adc248",
                        "type": "user"
                    }
                ]
            }
        }
    },
    "meta": {}
}
```

This resource allows you to create a new team.

### HTTP Request

`POST https://api.elastic.io/v2/teams/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``team`` |
| attributes.name | no | A team name. |

### Returns

Returns teams metadata object if the call succeeded.


## Add a new member to a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{TEAM_ID}/relationships/members \
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
    "data": {
        "id": "59d3ace74a819c0018e9bb92",
        "type": "team",
        "links": {
            "self": "/v2/teams/59d3ace74a819c0018e9bb92"
        },
        "attributes": {
            "name": "Test_Team"
        },
        "relationships": {
            "organization": {
                "data": {
                    "id": "59d22e7eeb865b0018adc247",
                    "type": "organization"
                },
                "links": {
                    "self": "/v2/organizations/59d22e7eeb865b0018adc247"
                }
            },
            "users": {
                "data": [
                    {
                        "id": "59d22e7eeb865b0018adc248",
                        "type": "user"
                    },
                    {
                        "id": "59f747c33f1d3c001901a44e",
                        "type": "user"
                    },
                    {
                        "id": "59d3562c68ed850019bde27f",
                        "type": "user"
                    }
                ]
            }
        }
    },
    "meta": {}
}
```

This resource allows you to add a new member to a team.

### HTTP Request

`POST https://api.elastic.io/v2/teams/{TEAM_ID}/relationships/members`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team identifier |


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| id | yes | Id of an already registered user, who will be added as a member of the team |


### Returns

Returns teams metadata object if the call succeeded.


## Remove a member from a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{TEAM_ID}/relationships/members \
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

{}
```

This resource allows you to remove a member from a team.

### HTTP Request

`DELETE https://api.elastic.io/v2/teams/{TEAM_ID}/relationships/members`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team identifier |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| id | yes | User identifier |


### Returns

Returns teams metadata object if the call succeeded.


## Delete a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{TEAM_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json

{}
```

This resource allows you to delete a team.
You cannot remove team which contains the repos, you should delete all repos first.

### HTTP Request

`DELETE https://api.elastic.io/v2/teams/{TEAM_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team ID |


### Returns

Returns empty body




