# Tenants

## What is a Tenant?

**Tenant** is a specific system's environment virtual installation (a system's clone, in other words) that allows customizing all the necessary parameters by sending a particular request to the API. Check the request examples below.

## Create a Tenant

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
  {
   "data":{
      "type":"tenant",
      "attributes":{
         "name":"My New Tenant",
         "app_domain":"{{app_domain}}",
         "api_domain":"{{api_domain}}",
         "webhooks_domain":"{{webhooks_domain}}",
         "git_receiver_host":"git_receiver_host",
         "code":"{{css_code}}",
         "header_logo_url":"//cdn.elastic.io/logo-mini.png",
         "loading_logo_url":"//cdn.elastic.io/logo-mini.png",
         "email_logo_url":"//cdn.elastic.io/logo-mini.png",
         "favicon_url":"//cdn.elastic.io/logo-mini.png",
         "terms_of_usage_url":"https://www.elastic.io/tou/",
         "privacy_policy_url":"https://www.elastic.io/privacy-policy/",
         "imprint_url":"https://www.elastic.io/legal-disclosure/",
         "mailchimp_api_key":"{{mailchimp_api_key}}",
         "mailchimp_list_id":"{{mailchimp_list_id}}",
         "mandrill_email_from":"foo@foo.bar",
         "mandrill_api_key":"{{mandrill_api_key}}",
         "hide_register":false,
         "is_default":false,
         "hide_repos":false,
         "hide_teams":false,
         "hide_ssh_keys":false,
         "hide_api_key":false,
         "hide_docs":false,
         "powered_by_elasticio":true,
         "css_enabled":false,
         "settings":{
            "member_api_key":false
         },
         "links":{
            "documentation":"https://docs.elastic.io/"
         }
      }
   }
}'
```


> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json
{
   "data":{
      "id":"5c6e91b9d5b4b60012a796fe",
      "type":"tenant",
      "links":{
         "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
      },
      "attributes":{
         "name":"My New Tenant",
         "app_domain":"{{app_domain}}",
         "api_domain":"{{api_domain}}",
         "webhooks_domain":"{{webhooks_domain}}",
         "git_receiver_host":"git_receiver_host",
         "css_enabled":false,
         "code":"{{css_code}}",
         "header_logo_url":"//cdn.elastic.io/logo-mini.png",
         "loading_logo_url":"//cdn.elastic.io/logo-mini.png",
         "email_logo_url":"//cdn.elastic.io/logo-mini.png",
         "favicon_url":"//cdn.elastic.io/logo-mini.png",
         "terms_of_usage_url":"https://www.elastic.io/tou/",
         "privacy_policy_url":"https://www.elastic.io/privacy-policy/",
         "imprint_url":"https://www.elastic.io/legal-disclosure/",
         "mailchimp_list_id":"{{mailchimp_list_id}}",
         "mandrill_email_from":"foo@foo.bar",
         "hide_repos":false,
         "hide_teams":false,
         "hide_ssh_keys":false,
         "hide_api_key":false,
         "hide_docs":false,
         "hide_register":false,
         "powered_by_elasticio":true,
         "ssl_certificates":{},
         "links":{
            "documentation":"https://docs.elastic.io/"
         }
      }
   },
   "meta":{},
   "links":{
      "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
   }
}
```

The endpoint below is responsible for creating a **Tenant**.


### HTTP Request

`POST {{ api_base_url }}/v2/tenants`


#### Authorization

This request is authorized for the users with the `tenants.tenant.create` permission.

### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "tenant"
attributes.name | yes      | Name of the Tenant
attributes.app_domain | yes      | Name of the Tenant domain
attributes.code | yes      |  Tenant CSS-style
attributes.api_domain | no      | Name of the Tenant API domain
attributes.webhooks_domain | no      | Name of the Tenant webhooks domain
attributes.git_receiver_host | no      | Name of the Tenant git receiver host
attributes.header_logo_url | no      | The URL of image which will be displayed in the page header
attributes.loading_logo_url | no      | The URL of image which will be displayed during the page loading
attributes.email_logo_url | no      | The URL of image which will be displayed in the emails
attributes.favicon_url | no      | The URL of image which will be displayed as favicon
attributes.terms_of_usage_url | no      | The URL which redirects to the terms of usage page
attributes.privacy_policy_url | no      | The URL which redirects to the privacy policy page
attributes.imprint_url | no     | The URL which redirects to the imprint page
attributes.mailchimp_api_key | no      | The MailChimp API key
attributes.mailchimp_list_id | no      | The MailChimp list id
attributes.mandrill_email_from | no      | An email of the letters sender
attributes.mandrill_api_key |no      | The mandrill API key
attributes.hide_register | no      | A value should be true or false
attributes.is_default | no      | A value should be true or false. You can set only one default tenant per installation
attributes.hide_repos | no      |A value should be true or false 
attributes.hide_teams | no      | A value should be true or false
attributes.hide_ssh_keys | no      | A value should be true or false
attributes.hide_api_key | no      | A value should be true or false
attributes.hide_docs | no      | A value should be true or false
attributes.powered_by_elasticio | no      | A value should be true or false
attributes.css_enabled | no      | A value should be true or false
attributes.settings.member_api_key | no      | A value should be true or false
attributes.links.documentation | no      | The URL which redirects to the documentation page


### 

Returns Tenant object if the call succeeded



## Update a Tenant

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID} \
    -X PATCH \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
{
   "data":{
      "type":"tenant",
      "attributes":{
         "ssl_certificates":{
            "app":"{{cert_id}}",
            "api":"{{cert_id}}",
            "webhooks":"{{cert_id}}"
         }
      }
   }
}'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":[
      {
         "id":"5c6e91b9d5b4b60012a796fe",
         "type":"tenant",
         "links":{
            "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
         },
         "attributes":{
            "name":"My New Tenant",
            "app_domain":"{{app_domain}}",
            "api_domain":"{{api_domain}}",
            "webhooks_domain":"{{webhooks_domain}}",
            "git_receiver_host":"git_receiver_host",
            "css_enabled":false,
            "code":"{{css_code}}",
            "header_logo_url":"//cdn.elastic.io/logo-mini.png",
            "loading_logo_url":"//cdn.elastic.io/logo-mini.png",
            "email_logo_url":"//cdn.elastic.io/logo-mini.png",
            "favicon_url":"//cdn.elastic.io/logo-mini.png",
            "terms_of_usage_url":"https://www.elastic.io/tou/",
            "privacy_policy_url":"https://www.elastic.io/privacy-policy/",
            "imprint_url":"https://www.elastic.io/legal-disclosure/",
            "mailchimp_list_id":"{{mailchimp_list_id}}",
            "mandrill_email_from":"foo@foo.bar",
            "hide_repos":false,
            "hide_teams":false,
            "hide_ssh_keys":false,
            "hide_api_key":false,
            "hide_docs":false,
            "hide_register":false,
            "powered_by_elasticio":true,
            "ssl_certificates":{
              "app":"{{cert_id}}",
              "api":"{{cert_id}}",
              "webhooks":"{{cert_id}}"
            }
            "links":{
               "documentation":"https://docs.elastic.io/"
            }
         }
      }
   ],
   "meta":{},
   "links":{
      "self":"/v2/tenants"
   }
}
```


This endpoint allows updating a Tenant.


### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}`


#### Authorization
This request is authorized for the users with the `tenants.tenant.edit` permission.


### URL Parameters
Parameter           | Description
------------------- | -----------
TENANT_ID         | The ID of the Tenant


### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
attributes.header_logo_url | no      | The URL of image which will be displayed in the page header
attributes.loading_logo_url | no      | The URL of image which will be displayed during the page loading
attributes.email_logo_url | no      | The URL of image which will be displayed in the emails
attributes.favicon_url | no      | The URL of image which will be displayed as favicon
attributes.terms_of_usage_url | no      | The URL which redirects to the terms of usage page
attributes.privacy_policy_url | no      | The URL which redirects to the privacy policy page
attributes.imprint_url | no     | The URL which redirects to the imprint page
attributes.mailchimp_api_key | no      | The MailChimp API key
attributes.mailchimp_list_id | no      | The MailChimp list id
attributes.mandrill_email_from | no      | An email of the letters sender
attributes.mandrill_api_key |no      | The mandrill API key
attributes.hide_register | no      | A value should be true or false
attributes.is_default | no      | A value should be true or false. You can set only one default tenant per installation
attributes.hide_repos | no      |A value should be true or false 
attributes.hide_teams | no      | A value should be true or false
attributes.hide_ssh_keys | no      | A value should be true or false
attributes.hide_api_key | no      | A value should be true or false
attributes.hide_docs | no      | A value should be true or false
attributes.powered_by_elasticio | no      | A value should be true or false
attributes.css_enabled | no      | A value should be true or false
attributes.settings.member_api_key | no      | A value should be true or false
attributes.links.documentation | no      | The URL which redirects to the documentation page
attributes.ssl_certificates.app | no      | An ID of SSL-certificate for a web-UI domain.
attributes.ssl_certificates.api | no| An ID of SSL-certificate for API domain.
attributes.ssl_certificates.webhooks | no| An ID of SSL-certificate for the webhooks domain.

*If Tenants' domains are matches to the ```*.elastic.io``` (where ```*``` can't contain ```.```) then given tenants can use the default certificates. To remove existed certificates, specify them as null (e.g. ```"app": null```)*

### Returns

Returns Tenant object if the call succeeded


## Get Tenants

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":[
      {
         "id":"5c6e91b9d5b4b60012a796fe",
         "type":"tenant",
         "links":{
            "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
         },
         "attributes":{
            "name":"My New Tenant",
            "app_domain":"{{app_domain}}",
            "api_domain":"{{api_domain}}",
            "webhooks_domain":"{{webhooks_domain}}",
            "git_receiver_host":"git_receiver_host",
            "css_enabled":false,
            "code":"{{css_code}}",
            "header_logo_url":"//cdn.elastic.io/logo-mini.png",
            "loading_logo_url":"//cdn.elastic.io/logo-mini.png",
            "email_logo_url":"//cdn.elastic.io/logo-mini.png",
            "favicon_url":"//cdn.elastic.io/logo-mini.png",
            "terms_of_usage_url":"https://www.elastic.io/tou/",
            "privacy_policy_url":"https://www.elastic.io/privacy-policy/",
            "imprint_url":"https://www.elastic.io/legal-disclosure/",
            "mailchimp_list_id":"{{mailchimp_list_id}}",
            "mandrill_email_from":"foo@foo.bar",
            "hide_repos":false,
            "hide_teams":false,
            "hide_ssh_keys":false,
            "hide_api_key":false,
            "hide_docs":false,
            "hide_register":false,
            "powered_by_elasticio":true,
            "ssl_certificates":{},
            "links":{
               "documentation":"https://docs.elastic.io/"
            }
         }
      }
   ],
   "meta":{},
   "links":{
      "self":"/v2/tenants"
   }
}
```

This endpoint returns all Tenants objects for a certain user.


### HTTP Request

`GET {{ api_base_url }}/v2/tenants/`

#### Authorization

This request is authorized for the users with the `tenants.tenant.get` permission.

## Get Tenant by Id

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":"5c6e91b9d5b4b60012a796fe",
      "type":"tenant",
      "links":{
         "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
      },
      "attributes":{
         "name":"My New Tenant",
         "app_domain":"{{app_domain}}",
         "api_domain":"{{api_domain}}",
         "webhooks_domain":"{{webhooks_domain}}",
         "git_receiver_host":"git_receiver_host",
         "css_enabled":false,
         "code":"{{css_code}}",
         "header_logo_url":"//cdn.elastic.io/logo-mini.png",
         "loading_logo_url":"//cdn.elastic.io/logo-mini.png",
         "email_logo_url":"//cdn.elastic.io/logo-mini.png",
         "favicon_url":"//cdn.elastic.io/logo-mini.png",
         "terms_of_usage_url":"https://www.elastic.io/tou/",
         "privacy_policy_url":"https://www.elastic.io/privacy-policy/",
         "imprint_url":"https://www.elastic.io/legal-disclosure/",
         "mailchimp_list_id":"{{mailchimp_list_id}}",
         "mandrill_email_from":"foo@foo.bar",
         "hide_repos":false,
         "hide_teams":false,
         "hide_ssh_keys":false,
         "hide_api_key":false,
         "hide_docs":false,
         "hide_register":false,
         "powered_by_elasticio":true,
         "ssl_certificates":{},
         "links":{
            "documentation":"https://docs.elastic.io/"
         }
      }
   },
   "meta":{},
   "links":{
      "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
   }
}
```

This endpoint returns a certain Tenant object.


### HTTP Request

`GET {{ api_base_url }}/v2/tenants/TENANT_ID/`

#### Authorization

This request is authorized for the users with the `tenants.tenant.get` permission.


### URL Parameters
Parameter       | Description
--------------- | -----------
TENANT_ID | The ID of the Tenant


## Delete Tenant

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/tenants/{TENANT_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

The endpoint deletes the Tenants scope along with everything it includes.

*A Tenant will be deleted only if it will not contain any contracts* 

### HTTP Request
`DELETE {{ api_base_url }}/v2/tenants/{TENANT_ID} \`

#### Authorization
This request is authorized for the users with the `tenants.tenant.delete` permission.

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID      | The ID of the Tenant


### Returns

Responds with the `204 No content` message if the call succeeded (with empty body).


## Get Tenant's roles

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"{TENANT-POLICY_ID}",
    "type":"tenant-policy",
    "attributes":{
      "roles":[
        {
          "i18n":{
            "en":"Admin"
          },
          "role":"admin",
          "permissions":[
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete",
            "contracts.repository.edit",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Member"
          },
          "role":"member",
          "permissions":[
            "contracts.workspace.create"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Admin"
          },
          "role":"admin",
          "permissions":[
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Integrator"
          },
          "role":"integrator",
          "permissions":[
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Guest"
          },
          "role":"guest",
          "permissions":[],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        }
      ]
    },
    "relationships":{
      "tenant":{
        "data":{
          "id":"{TENANT_ID}",
          "type":"tenant"
        },
        "links":{
          "self":"/v2/tenants/{TENANT_ID}"
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/tenants/{TENANT_ID}/roles"
  }
}

```

This endpoint returns the Roles for a specific Tenant.


### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

This request is authorized for the users with the `tenants.tenant.list_roles` permission.


### URL Parameters
Parameter       | Description
--------------- | -----------
TENANT_ID | The ID of the Tenant


## Get the list of available permissions 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/permissions
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":null,
      "type":"permissions",
      "attributes":{
         "permissions":[
            "contracts.contract.edit",
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete",
            "contracts.repository.edit",
            "contracts.devTeam.edit",
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
         ]
      }
   },
   "meta":{}
}
```
This endpoint returns all available permissions required for creating a Role.


### HTTP Request

`GET {{ api_base_url }}/v2/permissions`

#### Authorization

This endpoint is available to all the platforms' users.



## Update Tenant's roles 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles
   -X PATCH
   -u {EMAIL}:{APIKEY}
   -H 'Content-Type: application/json' -d '
    {
      "data":{
        "type":"tenant-policy",
        "attributes":{
          "roles":[
            {
              "role":"name_of_new_role",
              "scope":"contracts",
              "permissions":[
                "contracts.workspace.create",
                "contracts.devTeam.edit"
              ],
              "i18n":{
                "en":"new_role"
              }
            },
            {
              "role":"name_of_new_role",
              "scope":"workspaces",
              "permissions":[
                "workspaces.flow.edit",
                "workspaces.flow.toggleStatus",
                "workspaces.flow.toggleRealtime"
              ],
              "i18n":{
                "en":"new_role"
              }
            }
          ]
        }
      }
    }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "type":"tenant-policy",
    "attributes":{
      "roles":[
        {
          "i18n":{
            "en":"new_role"
          },
          "role":"name_of_new_role",
          "permissions":[
            "contracts.workspace.create",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"new_role"
          },
          "role":"name_of_new_role",
          "permissions":[
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        }
      ]
    },
    "relationships":{
      "tenant":{
        "data":{
          "id":"{TENANT_ID}",
          "type":"tenant"
        },
        "links":{
          "self":"/v2/tenants/{TENANT_ID}"
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/tenants/{TENANT_ID}/roles"
  }
}
```

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

This request is authorized for the users with the `tenants.tenant.edit_roles` permission.


### URL Parameters
Parameter       | Description
--------------- | -----------
TENANT_ID | The ID of the Tenant

### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "tenant-policy"
attributes.roles[] | yes      |An array of Tenant's roles. It can be empty. 
attributes.roles[].role | no     | Name of a role.
attributes.roles[].scope | no      | The group of objects, which is affected by this role. Value can be "contracts" or "workspaces" 
attributes.roles[].permissions[] | yes      | An array of permissions. It can be empty. To get the list of available permissions execute [Get the list of available permissions]({{ api_base_url }}/docs/v2/#get-the-list-of-available-permissions) endpoint 
attributes.roles[].i18n.{{language_key}} | no      | The name of a role in different languages. The value is only required for "en" key. For other languages value is optional



## Create a SSL certificate 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
	  {
	   "data":{
		  "attributes":{
		     "publicKey":"{CERTIFICATE}",
		     "privateKey":"{RSA PRIVATE KEY}"
	   }
	 }'
```

> Example Request (with attachment):

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: multipart/form-data'
   --form "cert=@file"
	  
```


> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json
{
   "data":{
      "id":"5c6e9f68d5b4b60012a7a933",
      "type":"certificate",
      "links":{
         "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe/certificates/5c6e9f68d5b4b60012a7a933"
      },
      "attributes":{
         "publicKey":"{CERTIFICATE}",
		 "privateKey":"{RSA PRIVATE KEY}",
         "salt":"3b07d847ba7580ea",
         "iv":"2df1049e2e6395eb",
         "owner":"5c4a0dde51a3d76ee8d6059d",
         "tenant":"5c6e91b9d5b4b60012a796fe",
         "algorithm":"aes-256-cbc",
         "key_length":32
      },
      "relationships":{
         "user":{
            "data":{
               "id":"5c4a0dde51a3d76ee8d6059d",
               "type":"user"
            },
            "links":{
               "self":"/v2/users/5c4a0dde51a3d76ee8d6059d"
            }
         },
         "tenant":{
            "data":{
               "id":"5c6e91b9d5b4b60012a796fe",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
            }
         }
      }
   },
   "meta":{
      "version":2,
      "subject":{
         "commonName":"www.example.com"
      },
      "issuer":{
         "commonName":"www.example.com"
      },
      "serial":"95098E44D7A54A6C",
      "notBefore":"2019-01-21T15:26:29.000Z",
      "notAfter":"2029-01-18T15:26:29.000Z",
      "subjectHash":"c2b12038",
      "signatureAlgorithm":"sha1WithRSAEncryption",
      "fingerPrint":"DC:F9:D7:FA:A3:ED:71:1D:7A:B1:68:D1:A9:6F:66:99:62:72:F3:6D",
      "publicKey":{
         "algorithm":"sha1WithRSAEncryption"
      },
      "altNames":[],
      "extensions":{
         "subjectKeyIdentifier":"51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "authorityKeyIdentifier":"keyid:51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "basicConstraints":"CA:TRUE"
      }
   }
}
```

The endpoint below is responsible for creating the **SSL certificate**.


### HTTP Request

`POST {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates`


#### Authorization

This request is authorized for the users with the `tenants.certificate.create` permission.

### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
attributes.publicKey | yes      | CERTIFICATE
attributes.privateKey | yes      | RSA PRIVATE KEY

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID      | The ID of the Tenant

### Returns

Returns Certificate object if the call succeeded


## Retrieve a SSL certificate by id

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID} \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":"5c6eb8b36a6666001080d609",
      "type":"certificate",
      "links":{
         "self":"/v2/tenants/5c6eb8a56a6666001080d5bc/certificates/5c6eb8b36a6666001080d609"
      },
      "attributes":{
         "salt":"c27c8f8a273c5fe1",
         "iv":"535e6289dd6d1d6e",
         "owner":"5c4a0dde51a3d76ee8d6059d",
         "tenant":"5c6eb8a56a6666001080d5bc",
         "algorithm":"aes-256-cbc",
         "key_length":32
      },
      "relationships":{
         "user":{
            "data":{
               "id":"5c4a0dde51a3d76ee8d6059d",
               "type":"user"
            },
            "links":{
               "self":"/v2/users/5c4a0dde51a3d76ee8d6059d"
            }
         },
         "tenant":{
            "data":{
               "id":"5c6eb8a56a6666001080d5bc",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/5c6eb8a56a6666001080d5bc"
            }
         }
      }
   },
   "meta":{
      "version":2,
      "subject":{
         "commonName":"www.example.com"
      },
      "issuer":{
         "commonName":"www.example.com"
      },
      "serial":"95098E44D7A54A6C",
      "notBefore":"2019-01-21T15:26:29.000Z",
      "notAfter":"2029-01-18T15:26:29.000Z",
      "subjectHash":"c2b12038",
      "signatureAlgorithm":"sha1WithRSAEncryption",
      "fingerPrint":"DC:F9:D7:FA:A3:ED:71:1D:7A:B1:68:D1:A9:6F:66:99:62:72:F3:6D",
      "publicKey":{
         "algorithm":"sha1WithRSAEncryption"
      },
      "altNames":[],
      "extensions":{
         "subjectKeyIdentifier":"51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "authorityKeyIdentifier":"keyid:51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "basicConstraints":"CA:TRUE"
      }
   }
}
```

This endpoint returns a Certificate object for certain certificate id.



### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID}`

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID      | The ID of the Tenant
CERTIFICATE_ID      | The ID of the Certificate


#### Authorization

This request is authorized for the users with the `tenants.certificate.get_encrypted` and/or `tenants.certificate.get_info` permissions.


### Returns

Returns Certificate object if the call succeeded


## Update a SSL certificate 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
	  {
	   "data":{
		  "attributes":{
		    "publicKey":"{CERTIFICATE}",
		    "privateKey":"{RSA PRIVATE KEY}"

		  }
	   }
	 }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":"5c6e9f68d5b4b60012a7a933",
      "type":"certificate",
      "links":{
         "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe/certificates/5c6e9f68d5b4b60012a7a933"
      },
      "attributes":{
         "privte_key":"{CERTIFICATE}",
         "public_key":"{RSA PRIVATE KEY}",
         "salt":"3b07d847ba7580ea",
         "iv":"2df1049e2e6395eb",
         "owner":"5c4a0dde51a3d76ee8d6059d",
         "tenant":"5c6e91b9d5b4b60012a796fe",
         "algorithm":"aes-256-cbc",
         "key_length":32
      },
      "relationships":{
         "user":{
            "data":{
               "id":"5c4a0dde51a3d76ee8d6059d",
               "type":"user"
            },
            "links":{
               "self":"/v2/users/5c4a0dde51a3d76ee8d6059d"
            }
         },
         "tenant":{
            "data":{
               "id":"5c6e91b9d5b4b60012a796fe",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/5c6e91b9d5b4b60012a796fe"
            }
         }
      }
   },
   "meta":{
      "version":2,
      "subject":{
         "commonName":"www.example.com"
      },
      "issuer":{
         "commonName":"www.example.com"
      },
      "serial":"95098E44D7A54A6C",
      "notBefore":"2019-01-21T15:26:29.000Z",
      "notAfter":"2029-01-18T15:26:29.000Z",
      "subjectHash":"c2b12038",
      "signatureAlgorithm":"sha1WithRSAEncryption",
      "fingerPrint":"DC:F9:D7:FA:A3:ED:71:1D:7A:B1:68:D1:A9:6F:66:99:62:72:F3:6D",
      "publicKey":{
         "algorithm":"sha1WithRSAEncryption"
      },
      "altNames":[],
      "extensions":{
         "subjectKeyIdentifier":"51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "authorityKeyIdentifier":"keyid:51:CC:13:79:84:DB:6D:CB:5F:17:BA:C4:4A:4B:A3:35:36:A2:C2:25",
         "basicConstraints":"CA:TRUE"
      }
   }
}
```

The endpoint below is responsible for updating the **SSL certificate**.


### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates{CERTIFICATE_ID}`


#### Authorization

This request is authorized for the users with the `tenants.certificate.edit` permission.

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID      | The ID of the Tenant
CERTIFICATE_ID      | The ID of the Certificate

### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
attributes.publicKey | yes      | CERTIFICATE
attributes.privateKey | yes      | RSA PRIVATE KEY

### Returns

Returns Certificate object if the call succeeded


## Delete Certificate

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates{CERTIFICATE_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

The endpoint deletes a Certificate.


### HTTP Request
`DELETE {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates{CERTIFICATE_ID} \`

#### Authorization

This request is authorized for the users with the `tenants.certificate.delete` permission.

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID      | The ID of the Tenant
CERTIFICATE_ID      | The ID of the Certificate


### Returns

Responds with the `204 No content` message if the call succeeded (with empty body).


## Granting Tenant Admin's permissions to the user

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "tenant-member"
           "attributes": {
               "roles": [
                 "tenant-admin"
               ]
           }
       }
    }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":"5c06a22e0aba010011aba767",
      "type":"tenant-member",
      "attributes":{
         "roles":[
            "tenant-admin"
         ]
      },
      "relationships":{
         "user":{
            "data":{
               "id":"5c06a22e0aba010011aba767",
               "type":"user"
            },
            "links":{
               "self":"/v2/users/5c06a22e0aba010011aba767"
            }
         },
         "tenant":{
            "data":{
               "id":"56c207adb9121181e650c0ef",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/56c207adb9121181e650c0ef"
            }
         }
      }
   },
   "meta":{}
}

```

This endpoint allows granting Tenant Admin's permissions to the user. 


### HTTP Request
`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the users with the `tenants.membership.edit` permission.

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID  | The ID of the Tenant
USER_ID          | The ID of the user to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be the "tenant-member".
attributes.roles[]  | yes       |A value should be the "tenant-admin".


### Returns

Returns the member's object if the call succeeded


## Remove Tenant Admin's permissions from the user

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "tenant-member"
           "attributes": {
               "roles": []
           }
       }
    }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
   "data":{
      "id":"5c06a22e0aba010011aba767",
      "type":"tenant-member",
      "attributes":{
         "roles":[]
      },
      "relationships":{
         "user":{
            "data":{
               "id":"5c06a22e0aba010011aba767",
               "type":"user"
            },
            "links":{
               "self":"/v2/users/5c06a22e0aba010011aba767"
            }
         },
         "tenant":{
            "data":{
               "id":"56c207adb9121181e650c0ef",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/56c207adb9121181e650c0ef"
            }
         }
      }
   },
   "meta":{}
}

```

This endpoint allows remove Tenant Admin's permissions from the user. 


### HTTP Request
`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the users with the `tenants.membership.edit` permission.

### URL Parameters
Parameter        | Description
---------------- | -----------
TENANT_ID  | The ID of the Tenant
USER_ID          | The ID of the user to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be the "tenant-member".
attributes.roles[]  | yes       |A value should be an empty array.


### Returns

Returns the member's object if the call succeeded