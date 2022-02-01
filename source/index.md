---
title: API Reference

language_tabs:
- shell: curl

toc_footers:
  - {{ toc_footer }}

includes:
  - auth-clients
  - auth-secrets
  - components
  - contracts
  - credentials
  - datasamples
  - flow-drafts
  - flow-versions
  - flows
  - logs
  - pubsub-topics
  - quota-usages
  - recipes
  - resources
  - executions
  - snapshots
  - sshkeys
  - stats
  - teams
  - tenants
  - users
  - workspaces


search: true
---

# Introduction

Welcome to the {{ product_name }} [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer)
API documentation v2. It adheres to the [JSON API](http://jsonapi.org) specifications:

*   Returns JSON-encoded responses (Content-Type: `application/json`),
*   Uses standard HTTP [response codes](#errors)
*   Uses authentication - **You can not use this API without registering at {{ product_name }} platform to get the [authentication](#authentication) credentials.**


## Authentication

We use a standard [HTTP Basic Authtentication](http://en.wikipedia.org/wiki/Basic_access_authentication)
mechanism to authenticate each API call with the {{ product_name }}.

*   `{EMAIL}` - **email address** you use to login to the platform.
*   `{APIKEY}` - a unique **API Key** generated for you found in the profile settings page.

> Example Request:

```shell
curl {{ api_base_url }}/v2/users/me \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "id": "USER_ID",
        "type": "user",
        "links": {
            "self": "/v2/users/USER_ID"
        },
        "attributes": {
            "first_name": "FIRST_NAME",
            "last_name": "LAST_NAME",
            "email": "EMAIL",
            "company": "COMPANY_NAME",
            "registered": "REGISTRATION_DATE",
            "last_login": "LAST_LOGIN_DATE"
        }
    },
    "meta": {}
}
```

### HTTP Request

Make an HTTP `GET` request to `/v2/users/me` endpoint.

### Query Parameters

No query parameters necessary for this call.

### Returns

Provides your user information.


## Errors

The {{ product_name }} API uses conventional HTTP response codes to inform the
requester about the success or failure of an API calls. Generally: Codes in the
`2xx` range mean success. Codes in the `4xx` range mean an error that failed given
the information provided. Codes in the `5xx` range mean an error with the
{{ product_name }} platform:


| Status Code | Meaning |
| ---------- | ------- |
| 200 - OK | Everything worked as expected |
| 201 - Created | Requested resource created |
| 204 - No Content | Request succeeded, nothing more to give |
| 400 - Bad Request | The server cannot or will not process the request due to client error. Often missing required parameter. |
| 401 - Unauthorized | No valid API key provided. |
| 403 - Forbidden | The request was valid, but the server is refusing action. The user might not have the necessary permissions for a resource |
| 404 - Not Found | The specified resource could not be found |
| 405 - Method Not Allowed | You tried to access a resource with an invalid method |
| 406 - Not Acceptable | Your used request in non JSON format |
| 409 - Conflict | The resource object’s type is not among the type(s) that constitute the collection represented by the endpoint or a POST request to create a resource with a client-generated ID that already exists |
| 410 - Gone | The resource requested has been removed from our servers |
| 413 | Payload too large |
| 418 | I'm a teapot |
| 429 - Too Many Requests | Too many requests hit the API too quickly. Please slow down. |
| 500 - Internal Server Error | We have a problem with our server. Try again later |
| 503 - Service Unavailable | We're temporarily offline for maintenance. Please try again later |
