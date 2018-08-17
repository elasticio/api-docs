#Teams

## Get user's teams


> Example Request:


```shell
curl {{ api_base_url }}/v1/teams/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.teams.list()
    .then(function(teams) {
        // do something with the teams
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id":"55083c567aea6f030000001a",
        "name":"My team",
        "members":[
            "5508411b34e5ac0300000019",
            "510fc14d173cff0200000003"
        ]
    }
]
```

This endpoint retrieves list of user's teams

### HTTP Request

`GET {{ api_base_url }}/v1/teams/`


### Returns

Returns teams metadata object if the call succeeded.


## Create team


> Example Request:


```shell
 curl {{ api_base_url }}/v1/teams \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "name": "My team"
   }'
```


```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.teams.create({
    "name": "My team"
}).then(function(team) {
    // do something with the team
});
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
    "id":"55083c567aea6f030000001a",
    "name":"My team",
    "members":["5508411b34e5ac0300000019"]
}
```

This endpoint creates new team for user

### HTTP Request

`POST {{ api_base_url }}/v1/teams/`

Parameter| Required | Description
--------- | -----------| -----------
name      | no | team name

### Returns

Returns teams metadata object if the call succeeded.

