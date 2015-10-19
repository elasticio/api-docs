#Repositories

## Get user's repositories

> Example Request:

```shell
curl https://api.elastic.io/v1/repos/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
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

`GET https://api.elastic.io/v1/repos/`

### Returns

Returns repositories metadata object if the call succeeded.

## Get user's repository

> Example Request:

```shell
curl https://api.elastic.io/v1/repos/{ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
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

`GET https://api.elastic.io/v1/repos/{REPO_ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | repository id

### Returns

Returns repositories metadata object if the call succeeded.


## Create repository


> Example Request:


```shell
curl https://api.elastic.io/v1/repos/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "name": "My Repo"
   }'
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

`POST https://api.elastic.io/v1/repos/`

Parameter | Required | Description
--------- | -----------| -----------
name      | no | repository name
team_id   | no | team this repo will belong to


### Returns

Returns repositories metadata object if the call succeeded.


## Delete repository


> Example Request:


```shell
curl https://api.elastic.io/v1/repos/{REPO_ID} \
   -u {EMAIL}:{APIKEY} \
   -X DELETE \
   -H 'Accept: application/json'
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{}
```

This endpoint delete repository

### HTTP Request

`DELETE https://api.elastic.io/v1/repos/{ID}`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID        | yes      | repository id


## Get env vars

> Example Request:

```shell
curl https://api.elastic.io/v1/repos/{REPO_ID}/env/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
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

`GET https://api.elastic.io/v1/repos/{REPO_ID}/env/`

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
curl https://api.elastic.io/v1/repos/{REPO_ID}/env/ \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' -d '
   {
       "API_KEY": "new_key",
       "API_SECRET": null
   }'
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

`PUT https://api.elastic.io/v1/repos/{REPO_ID}/env/`

### URL Parameters

Parameter | Required | Description
--------- | ---------| -----------
REPO_ID   | yes      | Repository ID


### Returns

Returns updated environment variables of repository if the call succeeded.
