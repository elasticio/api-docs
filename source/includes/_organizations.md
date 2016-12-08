#Organizations

## Create organization

this request requires user to be tenant admin

Parameter    | Required | Description
-------------| ---------| -----------
name         | yes      | Organization name
members      | no       | Array of objects with email and role keys
members.email| yes      | User's email
members.role | no       | User's role, may be 'admin', 'integrator' or 'guest'


###Returns

Returns Organization object if the call succeeded

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "name": "My Org",
       "members": [
            {
                "email": "test@email.com",
                "role": "admin"
            }
       ]
   }'
```

```
 TBD
```

> Example Response:

```json
{ 
  "data":
    { 
      "id": "58455777a0aec4f377faefc1",
      "type": "organization",
      "attributes": { 
        "name": "My Org"
      } 
   },
  "meta": {} 
}

```

##Remove member from organization

Operation requires organization admin access. Ownership of
user's Tasks, Accounts, Lookups and Teams would be transferred to admin User performing this operation.


###Returns

Request returns 200 OK status code and empty body if succeeded.

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{OrganizationId}/members/{UserId} \
    -XDELETE    \
    -u {EMAIL}:{APIKEY}'
```

```
 TBD
```
