#Teams

## Retrieve all teams


> Example Request:


```shell
curl https://api.elastic.io/v2/teams/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":[
      {
         "attributes":{
            "name":"singleteam"
         },
         "id":"5508411b34e5ac0300000019",
         "type":"team",
         "relationships":{
            "users":{
               "data":[
                  {
                     "type":"user",
                     "id":"5508411b34e5ac0300000020"
                  }
               ]
            }
         }
      }
   ],
   "meta":{}
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
   "data":[
      {
         "attributes":{
            "name":"myteam"
         },
         "id":"5508411b34e5ac0300000019",
         "type":"team",
         "relationships":{
            "users":{
               "data":[
                  {
                     "type":"user",
                     "id":"5508411b34e5ac0300000020"
                  }
               ]
            }
         }
      }
   ],
   "meta":{

   }
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":[
      {
         "attributes":{
            "name":"myteam"
         },
         "id":"5508411b34e5ac0300000019",
         "type":"team",
         "relationships":{
            "users":{
               "data":[
                  {
                     "type":"user",
                     "id":"{USER_ID}"
                  }
               ]
            }
         }
      }
   ],
   "meta":{}
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":[
      {
         "attributes":{
            "name":"myteam"
         },
         "id":"5508411b34e5ac0300000019",
         "type":"team",
         "relationships":{
            "users":{
               "data":[
                  {
                     "type":"user",
                     "id":"{user_id}"
                  }
               ]
            }
         }
      }
   ],
   "meta":{}
}
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{}
```

This resource allows you to delete a team.

### HTTP Request

`DELETE https://api.elastic.io/v2/teams/{TEAM_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| TEAM_ID | yes | Team ID |

You cannot remove teams with repos, you should delete them first.

### Returns

Returns empty body




