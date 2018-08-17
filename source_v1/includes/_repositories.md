#Repositories

## Get user's repositories

> Example Request:

```shell
curl {{ api_base_url }}/v1/repos/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.list()
    .then(function(repos) {
        // do something with the repos
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id": "555c5ade13c2298a9d32fe67",
    "name": "testrepo",
    "team_id": "5538bc1c9c0f0522391900d4"
  }
]
```

### HTTP Request

`GET {{ api_base_url }}/v1/repos/`

### Returns

Returns repositories metadata object if the call succeeded.

## Get user's repository

> Example Request:

```shell
curl {{ api_base_url }}/v1/repos/{REPO_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.retrieve({REPO_ID})
    .then(function(repo) {
        // do something with the repo
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

  {
    "id": "555c5ade13c2298a9d32fe67",
    "name": "testrepo",
    "team_id": "5538bc1c9c0f0522391900d4"
  }
```

### HTTP Request

`GET {{ api_base_url }}/v1/repos/{REPO_ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | repository id

### Returns

Returns repositories metadata object if the call succeeded.


## Create repository


> Example Request:


```shell
curl {{ api_base_url }}/v1/repos/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "name": "My Repo"
   }'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.create({
    "name": "My Repo"
}).then(function(repo) {
    // do something with the repo
 });
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
    "name":"repository name",
    "id": "repo_id",
    "team_id": "team_id",
     "is_public": false
}
```

This endpoint creates new custom repository

### HTTP Request

`POST {{ api_base_url }}/v1/repos/`

Parameter | Required | Description
--------- | -----------| -----------
name      | no | repository name
team_id   | no | team this repo will belong to


### Returns

Returns repositories metadata object if the call succeeded.


## Delete repository


> Example Request:


```shell
curl {{ api_base_url }}/v1/repos/{REPO_ID} \
   -u {EMAIL}:{APIKEY} \
   -X DELETE \
   -H 'Accept: application/json'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.delete({REPO_ID});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{}
```

This endpoint delete repository

### HTTP Request

`DELETE {{ api_base_url }}/v1/repos/{ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID        | yes      | repository id


## Get env vars

> Example Request:

```shell
curl {{ api_base_url }}/v1/repos/{REPO_ID}/env/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.retrieveEnvVars({REPO_ID})
    .then(function(vars) {
        // do something with the env vars
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "API_KEY": "key",
    "API_SECRET": "secret"
}
```

### HTTP Request

`GET {{ api_base_url }}/v1/repos/{REPO_ID}/env/`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | Repository ID

### Returns

Returns environment variables of repository if the call succeeded.


## Modify env vars
Update env vars for repository. You can update existing env vars by setting them again, and remove by setting it to NULL.

> Example Request:

```shell
curl {{ api_base_url }}/v1/repos/{REPO_ID}/env/ \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "API_KEY": "new_key",
       "API_SECRET": "new_secret"
   }'
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.repos.updateEnvVars({REPO_ID}, {
    "API_KEY": "new_key",
    "API_SECRET": "new_secret"
});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "API_KEY": "new_key"
}
```

### HTTP Request

`PUT {{ api_base_url }}/v1/repos/{REPO_ID}/env/`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | Repository ID


### Returns

Returns updated environment variables of repository if the call succeeded.
