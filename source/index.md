---
title: API Reference

language_tabs:
- shell: curl

toc_footers:
  - {{ toc_footer }}

includes:
  - agents
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

Welcome to {{ product_name }}. This documentation is a full reference for the REST API documentation v2.
The API implements the [JSON API](http://jsonapi.org) specification. We encourage the reader to familiarise himself
with the details of the [JSON API](http://jsonapi.org) specification.


## Authentication

You authenticate to the {{ product_name }} API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your email as the basic auth username and API key as the password.

```shell
curl {{ api_base_url }}/v2/users/me \
   -u {EMAIL}:{APIKEY}
```


## Status Codes

### Success

The {{ product_name }} API responds with following status codes upon successful requests:


Status Code | Meaning
---------- | -------
200 | Ok -- Successful HTTP requests
201 | Created --  requested resource has been created successfully

### Errors

The {{ product_name }} API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- The server cannot or will not process the request due to an apparent client error
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The request was valid, but the server is refusing action. The user might not have the necessary permissions for a resource
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
409 | The resource object’s type is not among the type(s) that constitute the collection represented by the endpoint or a POST request to create a resource with a client-generated ID that already exists
410 | Gone -- The resource requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too many resources! Slow down!
500 | Internal Server Error -- We have a problem with our server. Try again later
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later
