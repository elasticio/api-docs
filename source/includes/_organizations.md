#Organizations

## Create organization

this request requires user to be tenant admin

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

```javascript
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