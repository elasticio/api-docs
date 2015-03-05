---
title: API Reference

language_tabs:
  - curl

toc_footers:
  - <a href='https://app.elastic.io'>Sign Up for a Developer Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the elastic.io REST API!

# Authentication

You authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

````curl
curl https://api.elastic.io/v1/ \
   -u {USERNAME}:{PASSWORD}
````

# Users

## Register new user

> Example Request:

```curl
curl https://api.elastic.io/v1/users \
   -u {USERNAME}:{PASSWORD} \
   -d email="test@example.com" \
   -d first_name="John" \
   -d last_name="Doe"
```

> Example Response:

```json
{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com",
  "api_secret_key": "781fb2a9-a5ce-4f5c-b166-74dd743409fb"
}
```

This endpoint registers a new user.

### HTTP Request

`POST https://api.elastic.io/v1/users`

### Arguments

Parameter | Description
--------- | -----------
email | User’s email address.
first_name | User’s first name.
last_name | User’s last name.

#### Returns

Returns a user object if the call succeeded. The returned object will have an API secret used to make requests on user's behalf.

# Recipes

## Retrieve a Recipe


> Example Request:


```curl
curl https://api.elastic.io/v1/recipes/{RECIPE_ID} \
   -u {USERNAME}:{PASSWORD}
```

> Example Response:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a recipe by given ID.

<aside class="warning">If you're not using an administrator API key, note that some kittens will return 403 Forbidden if they are hidden for admins only.</aside>

### HTTP Request

`GET https://api.elastic.io/v1/recipes/{RECIPE_ID}`

### URL Parameters

Parameter | Description
--------- | -----------
RECIPE_ID | The ID of the recipe to retrieve

### Returns

Returns a recipe's metadata object if the call succeeded. The returned object will have an recipe's title and account metadata.

## Create a Recipe

> Example Request:

```curl
curl https://api.elastic.io/v1/recipes \
   -u {USERNAME}:{PASSWORD} \
   -d accounts="ACCOUNTS"
```

> Example Response:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint creates tasks from a given recipe.

### HTTP Request

`POST https://api.elastic.io/v1/recipes`

### Arguments

Parameter | Description
--------- | -----------
accounts | Lorem ipsum

