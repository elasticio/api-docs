#Teams

## Get user's teams


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

This endpoint retrieves list of user's teams

### HTTP Request

`GET https://api.elastic.io/v2/teams/`


### Returns

Returns teams metadata object if the call succeeded.


## Create team


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

This endpoint creates new team for user

### HTTP Request

`POST https://api.elastic.io/v2/teams/`

Parameter| Required | Description
--------- | -----------| -----------
name      | no | team name

### Returns

Returns teams metadata object if the call succeeded.


## Add user to a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{team_id}/relationships/members \
   -X POST \
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
            "name":"{team_name}"
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

This endpoint adds user to a team

### HTTP Request

`POST https://api.elastic.io/v2/teams/{team_id}/relationships/members`

Parameter| Required | Description
--------- | -----------| -----------
id      | yes | user's ID
type      | yes | should be "user"


### Returns

Returns teams metadata object if the call succeeded.


## Remove user from a team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{team_id}/relationships/members \
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
            "name":"{team_name}"
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

This endpoint removes user from a team

### HTTP Request

`DELETE https://api.elastic.io/v2/teams/{team_id}/relationships/members`

Parameter| Required | Description
--------- | -----------| -----------
id      | yes | user's ID
type      | yes | should be "user"


### Returns

Returns teams metadata object if the call succeeded.


## Remove team


> Example Request:


```shell
 curl https://api.elastic.io/v2/teams/{team_id} \
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

This endpoint removes a team. It will only be executed if team has no repositories.

### HTTP Request

`DELETE https://api.elastic.io/v2/teams/{team_id}`


### Returns

Returns empty body




