# Agents
 
 Request / Role | Tenant Admin | Workspace Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Retrieve all agents|-|X|X|X|
Сreate agent|-|X|X|X
 
## Retrieve all agents


> Example Request:


```shell
curl https://api.elastic.io/v2/agents?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data":[
      {
         "id":"{AGENT_ID}",
         "type":"agent",
         "links":{
            "self":"/v2/agents/{AGENT_ID}"
         },
         "attributes":{
            "title":"agent title",
            "status":"online",
            "last_seen":"2017-10-04T19:02:19.188Z"
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspaces/{WORKSPACE_ID}"
               }
            }
         }
      }
   ],
   "meta":{}
}
```

This resource allows you to retrieve all the agents belonging to the given Workspace.

### HTTP Request

`GET https://api.elastic.io/v2/agents?workspace_id={WORKSPACE_ID}`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|workspace_id|yes|An Id of the Workspace|

### Returns

Returns all the agents belonging to the given Workspace.


## Сreate agent


> Example Request:


```shell
curl https://api.elastic.io/v2/agents \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"agent",
       "attributes":{
         "title":"agent title",
         "description":"agent description"
       },
       "relationships":{
         "workspace":{
           "data":{
             "id":"59d341e9037f7200184a408b",
             "type":"workspace"
           }
         }
       }
     }
   }'
```



> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
   "data":{
      "id":"{AGENT_ID}",
      "type":"agent",
      "links":{
         "self":"/v2/agents/{AGENT_ID}"
      },
      "attributes":{
         "title":"agent title",
         "description":"agent description",
         "status":"pending"
      },
      "relationships":{
         "workspace":{
            "data":{
               "id":"{WORKSPACE_ID}",
               "type":"workspace"
            },
            "links":{
               "self":"/v2/workspaces/{WORKSPACE_ID}"
            }
         }
      }
   },
   "meta":{}
}
```

This resource allows you to create a new agent. The agent is created in ``pending`` state and our support is informed about it.
We will contact you within 2-3 working days.

### HTTP Request

`POST https://api.elastic.io/v2/agents/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``agent`` |
| attributes.title | yes | Agent title |
| attributes.description | yes | Agent description |
| relationships.workspace.data.id | yes | An Id of the Workspace |
| relationships.workspace.data.type | yes | A value must be ``workspace``  |

### Returns

Returns the created agent object.
