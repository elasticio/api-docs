# Agents
 
## Retrieve all agents


> Example Request:


```shell
curl https://api.elastic.io/v2/agents \
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
  "data": [
    {
      "id": "{AGENT_ID}",
      "type": "agent",
      "links": {
        "self": "/v2/agents/{AGENT_ID}"
      },
      "attributes": {
        "title": "agent title",
        "status": "online",
        "last_seen": "2017-10-04T19:02:19.188Z"
      },
      "relationships": {
        "organization": {
          "data": {
            "id": "{ORGANIZATION_ID}",
            "type": "organization"
          },
          "links": {
            "self": "/v2/organizations/{ORGANIZATION_ID}"
          }
        }
      }
    }
  ],
  "meta": {}
}
```

This resource allows you to retrieve all the agents belonging to the given organization.

### HTTP Request

`GET https://api.elastic.io/v2/agents/`

### Returns

Returns all the agents belonging to the given organization.
