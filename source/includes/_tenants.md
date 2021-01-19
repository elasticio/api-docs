# Tenants

## What is a Tenant?

**Tenant** is a specific system's environment virtual installation (a system's clone, basically) that allows customizing all the necessary parameters by sending a particular request to the API.

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
      "header_logo_url":"//cdn.example.com/logo-mini.png",
      "loading_logo_url":"//cdn.example.com/logo-mini.png",
      "email_logo_url":"//cdn.example.com/logo-mini.png",
      "favicon_url":"//cdn.example.com/logo-mini.png",
      "terms_of_usage_url":"https://www.example.com/tou/",
      "privacy_policy_url":"https://www.example.com/privacy-policy/",
      "imprint_url":"https://www.example.com/legal-disclosure/",
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
      "docs_base_url":"https://docs.example.com/",
      "component_docs_base_url":"https://docs.example.com/components/",
      "default_workspace_type":"limited",
      "custom_stylesheets":[
        {
          "href":"http://path-to-1.css"
        },
        {
          "href":"http://path-to-2.css"
        }
      ],
      "custom_scripts":[
        {
          "src":"http://path-to-1.js"
        },
        {
          "src":"http://path-to-2.js"
        }
      ],
      "settings":{
        "member_api_key":false
      },
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
      "custom_nav_menu_items":[
        {
          "title":"Catalogs",
          "icon":"catalog-icon",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://flow-catalog.example.com",
              "title":"Flow catalog",
              "icon":"flow-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            },
            {
              "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
              "title":"Components catalog",
              "icon":"components-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            }
          ]
        },
        {
          "title":"Quick Help",
          "icon":"help",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://docs.example.com",
              "title":"Documentation",
              "icon":"description",
              "target":"_blank"
            },
            {
              "title":"Help Center",
              "icon":"forum",
              "custom_class":"intercom-launcher"
            }
          ]
        }
      ],
      "html_meta":{
        "description":"Lorem ipsum",
        "author":"Acme Corporation",
        "keywords":[
          "foo",
          "bar",
          "baz"
        ]
      },
      "feature_flags":{
          "old_mapper_enabled":false
      }
    }
  }
}`
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
      "header_logo_url":"//cdn.example.com/logo-mini.png",
      "loading_logo_url":"//cdn.example.com/logo-mini.png",
      "email_logo_url":"//cdn.example.com/logo-mini.png",
      "favicon_url":"//cdn.example.com/logo-mini.png",
      "terms_of_usage_url":"https://www.example.com/tou/",
      "privacy_policy_url":"https://www.example.com/privacy-policy/",
      "imprint_url":"https://www.example.com/legal-disclosure/",
      "mailchimp_list_id":"{{mailchimp_list_id}}",
      "mandrill_email_from":"foo@foo.bar",
      "hide_repos":false,
      "hide_teams":false,
      "hide_ssh_keys":false,
      "hide_api_key":false,
      "hide_docs":false,
      "hide_register":false,
      "powered_by_elasticio":true,
      "docs_base_url":"https://docs.example.com/",
      "component_docs_base_url":"https://docs.example.com/components/",
      "default_workspace_type":"limited",
      "ssl_certificates":{},
      "custom_stylesheets":[
        {
          "href":"http://path-to-1.css"
        },
        {
          "href":"http://path-to-2.css"
        }
      ],
      "custom_scripts":[
        {
          "src":"http://path-to-1.js"
        },
        {
          "src":"http://path-to-2.js"
        }
      ],
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
      "custom_nav_menu_items":[
        {
          "title":"Catalogs",
          "icon":"catalog-icon",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://flow-catalog.example.com",
              "title":"Flow catalog",
              "icon":"flow-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            },
            {
              "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
              "title":"Components catalog",
              "icon":"components-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            }
          ]
        },
        {
          "title":"Quick Help",
          "icon":"help",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://docs.example.com",
              "title":"Documentation",
              "icon":"description",
              "target":"_blank"
            },
            {
              "title":"Help Center",
              "icon":"forum",
              "custom_class":"intercom-launcher"
            }
          ]
        }
      ],
      "html_meta":{
        "description":"Lorem ipsum",
        "author":"Acme Corporation",
        "keywords":[
          "foo",
          "bar",
          "baz"
        ]
      },
      "feature_flags":{
          "old_mapper_enabled":false
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a new **Tenant**.

### HTTP Request

`POST {{ api_base_url }}/v2/tenants`

#### Authorization

This request is authorized for the users with the `tenants.tenant.create` permission.

### Payload Parameters

| Parameter                               | Required | Description
| --------------------------------------- | -------- | ------------------------------------------------------ |
| type                                    | yes      | A value should be "tenant"   |
| attributes.name                         | yes      | Name of the Tenant    |
| attributes.app_domain                   | yes      | Name of the Tenant domain   |
| attributes.code                         | yes      | Tenant CSS-style     |
| attributes.mandrill_email_from          | yes      | An email of the letters sender   |
| attributes.api_domain                   | no       | Name of the Tenant API domain   |
| attributes.webhooks_domain              | no       | Name of the Tenant webhooks domain     |
| attributes.git_receiver_host            | no       | Name of the Tenant git receiver host |
| attributes.header_logo_url              | no       | The URL of image which will be displayed in the navigation panel (logo size 40x40 pixels, logo format - .png or .svg)|
| attributes.loading_logo_url             | no       | The URL of image which will be displayed during the page loading  |
| attributes.email_logo_url               | no       | The URL of image which will be displayed in the emails   |
| attributes.favicon_url                  | no       | The URL of image which will be displayed as favicon   |
| attributes.terms_of_usage_url           | no       | The URL which redirects to the terms of usage page |
| attributes.privacy_policy_url           | no       | The URL which redirects to the privacy policy page |
| attributes.imprint_url                  | no       | The URL which redirects to the imprint page   |
| attributes.mailchimp_api_key            | no       | The MailChimp API key   |
| attributes.mailchimp_list_id            | no       | The MailChimp list id |
| attributes.mandrill_api_key             | no       | The mandrill API key |
| attributes.hide_register                | no       | A value should be true or false |
| attributes.is_default                   | no       | A value should be true or false. You can set only one default tenant per installation      |
| attributes.hide_repos                   | no       | A value should be true or false   |
| attributes.hide_teams                   | no       | A value should be true or false |
| attributes.hide_ssh_keys                | no       | A value should be true or false |
| attributes.hide_api_key                 | no       | A value should be true or false    |
| attributes.hide_docs                    | no       | A value should be true or false   |
| attributes.powered_by_elasticio         | no       | A value should be true or false   |
| attributes.docs_base_url                | no       | This link will applied to the Quick Help =>> Documentation menu and to the repository page docs link |
| attributes.component_docs_base_url      | no       | Base URL for relative paths to component docs. E.g. if this url is `https://docs.example.com/` and `component.json` contains the following field `"help": {"link": "salesforce"}`, we will use `https://docs.example.com/salesforce` as a link to documentation of this component on the frontend. If this property is not set, relative urls won't be displayed. If this property is set, make sure `component_docs_base_url` and 'getting-started/credential.html' page exists  |
| attributes.css_enabled                  | no       | A value should be true or false   |
| attributes.email_templates                  | no       | A hashMap of represent [emails](#list-of-emails-sent-by-the-platform) will be sent. By default "repo-new-version" and "repo-new-version-in-workspace-flows" are set to false |
| attributes.settings.member_api_key      | no       | A value should be true or false |
| attributes.custom_nav_menu_items        | no       | The custome menu |
| attributes.custom_nav_menu_items\[].title        | yes      | The link text |
| attributes.custom_nav_menu_items\[].icon         | yes      | The icon name from [material-icons](https://material.io/tools/icons/?style=baseline)   |
| attributes.custom_nav_menu_items\[].custom_class | no       | The class added to <a> tag   |
| attributes.custom_nav_menu_items\[].links\[].url   | yes      | The URL which redirects to the needed page  |
| attributes.custom_nav_menu_items\[].links\[].title   | yes      | The link text |
| attributes.custom_nav_menu_items\[].links\[].icon  | yes      |The icon name from [material-icons](https://material.io/tools/icons/?style=baseline) |
| attributes.custom_nav_menu_items\[].links\[].custom_class   | no      | The class added to <a> tag   |
| attributes.custom_nav_menu_items\[].links\[].target   | no      | A value can be `modal` or `_blank`. In case of "target"="modal" link will be opened in the modal window. In case of "target":"_blank", link will be opened in the new tab. The value by default is `_blank`   |
| attributes.custom_stylesheets\[]         | no       | Customer css stylesheets  |
| attributes.custom_scripts\[]             | no       | Customer js-scripts   |
| attributes.default_workspace_type       | no       | Default Workspace type for Workspaces created in the Tenant. The value can be `full` or `limited`. If not specified, the attribute will be set to `full`or `limited` depending on Tenant settings. |
| attributes.html_meta.description        | no       | Customer meta description in html pages    |
| attributes.html_meta.author             | no       | Customer meta author in html pages  |
| attributes.html_meta.keywords           | no       | Customer meta keywords in html pages     |
| attributes.feature_flags.old_mapper_enabled       | no | Enable ability to use deprecated mapper UI. Default: "false" |

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
      },
      "default_workspace_type":"full",
      "docs_base_url":"https://docs.example.com/",
      "component_docs_base_url":"https://docs.example.com/components/",
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
      "custom_nav_menu_items":[
        {
          "title":"Catalogs",
          "icon":"catalog-icon",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://flow-catalog.example.com",
              "title":"Flow catalog",
              "icon":"flow-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            },
            {
              "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
              "title":"Components catalog",
              "icon":"components-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            }
          ]
        },
        {
          "title":"Quick Help",
          "icon":"help",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://docs.example.com",
              "title":"Documentation",
              "icon":"description",
              "target":"_blank"
            },
            {
              "title":"Help Center",
              "icon":"forum",
              "custom_class":"intercom-launcher"
            }
          ]
        }
      ],
      "custom_stylesheets":[
        {
          "href":"http://path-to-1.css"
        },
        {
          "href":"http://path-to-2.css"
        }
      ],
      "custom_scripts":[
        {
          "src":"http://path-to-1.js"
        },
        {
          "src":"http://path-to-2.js"
        }
      ],
      "feature_flags":{
          "old_mapper_enabled":false
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
      "header_logo_url":"//cdn.example.com/logo-mini.png",
      "loading_logo_url":"//cdn.example.com/logo-mini.png",
      "email_logo_url":"//cdn.example.com/logo-mini.png",
      "favicon_url":"//cdn.example.com/logo-mini.png",
      "terms_of_usage_url":"https://www.example.com/tou/",
      "privacy_policy_url":"https://www.example.com/privacy-policy/",
      "imprint_url":"https://www.example.com/legal-disclosure/",
      "mailchimp_list_id":"{{mailchimp_list_id}}",
      "mandrill_email_from":"foo@foo.bar",
      "hide_repos":false,
      "hide_teams":false,
      "hide_ssh_keys":false,
      "hide_api_key":false,
      "hide_docs":false,
      "hide_register":false,
      "powered_by_elasticio":true,
      "docs_base_url":"https://docs.example.com/",
      "component_docs_base_url":"https://docs.example.com/components/",
      "default_workspace_type":"full",
      "custom_stylesheets":[
        {
          "href":"http://path-to-1.css"
        },
        {
          "href":"http://path-to-2.css"
        }
      ],
      "custom_scripts":[
        {
          "src":"http://path-to-1.js"
        },
        {
          "src":"http://path-to-2.js"
        }
      ],
      "ssl_certificates":{
        "app":"{{cert_id}}",
        "api":"{{cert_id}}",
        "webhooks":"{{cert_id}}"
      },
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
      "custom_nav_menu_items":[
        {
          "title":"Catalogs",
          "icon":"catalog-icon",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://flow-catalog.example.com",
              "title":"Flow catalog",
              "icon":"flow-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            },
            {
              "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
              "title":"Components catalog",
              "icon":"components-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            }
          ]
        },
        {
          "title":"Quick Help",
          "icon":"help",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://docs.example.com",
              "title":"Documentation",
              "icon":"description",
              "target":"_blank"
            },
            {
              "title":"Help Center",
              "icon":"forum",
              "custom_class":"intercom-launcher"
            }
          ]
        }
      ],
      "feature_flags":{
          "old_mapper_enabled":false
      }
    },
    "meta":{}
  }
}
```

This resource allows you to update a given **Tenant**.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}`

#### Authorization

This request is authorized for the users with the `tenants.tenant.edit` permission.

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

### Payload Parameters

| Parameter                               | Required | Description  |
| --------------------------------------- | -------- | ------------------------------------------------------ |
| attributes.header_logo_url              | no       | The URL of image which will be displayed in the navigation panel (logo size 40x40 pixels, logo format - .png or .svg)|
| attributes.loading_logo_url             | no       | The URL of image which will be displayed during the page loading |
| attributes.email_logo_url               | no       | The URL of image which will be displayed in the emails|
| attributes.favicon_url                  | no       | The URL of image which will be displayed as favicon|
| attributes.terms_of_usage_url           | no       | The URL which redirects to the terms of usage page|
| attributes.privacy_policy_url           | no       | The URL which redirects to the privacy policy page|
| attributes.imprint_url                  | no       | The URL which redirects to the imprint page|
| attributes.mailchimp_api_key            | no       | The MailChimp API key|
| attributes.mailchimp_list_id            | no       | The MailChimp list id|
| attributes.mandrill_email_from          | no       | An email of the letters sender|
| attributes.mandrill_api_key             | no       | The mandrill API key|
| attributes.hide_register                | no       | A value should be true or false     |
| attributes.is_default                   | no       | A value should be true or false. You can set only one default tenant per installation  |
| attributes.hide_repos                   | no       | Allowed values: `true`, `false`       |
| attributes.hide_teams                   | no       | Allowed values: `true`, `false`      |
| attributes.hide_ssh_keys                | no       | Allowed values: `true`, `false`    |
| attributes.hide_api_key                 | no       | Allowed values: `true`, `false`  |
| attributes.hide_docs                    | no       | Allowed values: `true`, `false`  |
| attributes.powered_by_elasticio         | no       | Allowed values: `true`, `false`  |
| attributes.css_enabled                  | no       | Allowed values: `true`, `false` |
| attributes.email_templates              | no       | A hashMap of represent [emails](#list-of-emails-sent-by-the-platform) will be sent. By default "repo-new-version" and "repo-new-version-in-workspace-flows" are set to false |
| attributes.settings.member_api_key      | no       | Allowed values: `true`, `false` |
| attributes.email_templates              | no       | A hashMap of represent [emails](#list-of-emails-sent-by-the-platform) will be sent. By default "repo-new-version" and "repo-new-version-in-workspace-flows" are set to false |
| attributes.links                        | no       | The value should be null as this attribute is not supported anymore. Please use the `custom_nav_menu_items` instead |
| attributes.docs_base_url         | no       | This link will applied to the Quick Help =>> Documentation menu and to the repository page docs link |
| attributes.component_docs_base_url      | no       | Base URL for relative paths to component docs. E.g. if this url is `https://docs.example.com/components/` and `component.json` contains the following field `"help": {"link": "salesforce"}`, on frontend we will use `https://docs.example.com/components/salesforce` as a link to documentation of this component. If this property is not set, relative urls won't be displayed. If this property is set, make sure component_docs_base_url + 'getting-started/credential.html' page exists |
| attributes.custom_nav_menu_items\[].title        | yes      | The link text |
| attributes.custom_nav_menu_items\[].icon         | yes      | The icon name from [material-icons](https://material.io/tools/icons/?style=baseline)   |
| attributes.custom_nav_menu_items\[].custom_class | no       | The class added to <a> tag   |
| attributes.custom_nav_menu_items\[].links\[].url   | yes      | The URL which redirects to the needed page  |
| attributes.custom_nav_menu_items\[].links\[].title   | yes      | The link text |
| attributes.custom_nav_menu_items\[].links\[].icon  | yes      |The icon name from [material-icons](https://material.io/tools/icons/?style=baseline) |
| attributes.custom_nav_menu_items\[].links\[].custom_class   | no      | The class added to <a> tag   |
| attributes.custom_nav_menu_items\[].links\[].target   | no      | A value can be `modal` or `_blank`. In case of "target"="modal" link will be opened in the modal window. In case of "target":"_blank", link will be opened in the new tab. The value by default is `_blank`   |
| attributes.ssl_certificates.app         | no       | An ID of SSL-certificate for a web-UI domain.  |
| attributes.ssl_certificates.api         | no       | An ID of SSL-certificate for API domain.      |
| attributes.ssl_certificates.webhooks    | no       | An ID of SSL-certificate for the webhooks domain.   |
| attributes.custom_stylesheets\[]         | no       | Customer css stylesheets. |
| attributes.custom_scripts\[]             | no       | Customer js-scripts.      |
| attributes.default_workspace_type       | no       | The type of Workspaces which will be created in given Tenant. The value must be `full` or `limited`        |
| attributes.feature_flags.old_mapper_enabled       | no | Enable ability to use deprecated mapper UI. Default: "false" |

_Note_: If the default installation's certificate is a wildcard one (e.g. `*.example.com`) and the Tenant's domains match to this certificate (e.g. `my-tenant-api.example.com`), then there is no need to provide separate certificates for these domains. To remove existing certificates, set them to `null` (e.g. `"app": null`).

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
        "header_logo_url":"//cdn.example.com/logo-mini.png",
        "loading_logo_url":"//cdn.example.com/logo-mini.png",
        "email_logo_url":"//cdn.example.com/logo-mini.png",
        "favicon_url":"//cdn.example.com/logo-mini.png",
        "terms_of_usage_url":"https://www.example.com/tou/",
        "privacy_policy_url":"https://www.example.com/privacy-policy/",
        "imprint_url":"https://www.example.com/legal-disclosure/",
        "mailchimp_list_id":"{{mailchimp_list_id}}",
        "mandrill_email_from":"foo@foo.bar",
        "hide_repos":false,
        "hide_teams":false,
        "hide_ssh_keys":false,
        "hide_api_key":false,
        "hide_docs":false,
        "hide_register":false,
        "powered_by_elasticio":true,
        "docs_base_url":"https://docs.example.com/",
        "component_docs_base_url":"https://docs.example.com/components/",
        "ssl_certificates":{},
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
        "custom_nav_menu_items":[
          {
            "title":"Catalogs",
            "icon":"catalog-icon",
            "custom_class":"custom_class",
            "links":[
              {
                "url":"https://flow-catalog.example.com",
                "title":"Flow catalog",
                "icon":"flow-catalog-icon",
                "custom_class":"custom_class",
                "target":"modal"
              },
              {
                "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
                "title":"Components catalog",
                "icon":"components-catalog-icon",
                "custom_class":"custom_class",
                "target":"modal"
              }
            ]
          },
          {
            "title":"Quick Help",
            "icon":"help",
            "custom_class":"custom_class",
            "links":[
              {
                "url":"https://docs.example.com",
                "title":"Documentation",
                "icon":"description",
                "target":"_blank"
              },
              {
                "title":"Help Center",
                "icon":"forum",
                "custom_class":"intercom-launcher"
              }
            ]
          }
        ],
        "feature_flags":{
            "old_mapper_enabled":false
        }
      },
      "meta":{},
    }
  ]
}
```

This resource allows you to retrieve all **Tenants** of the current user.

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
      "header_logo_url":"//cdn.example.com/logo-mini.png",
      "loading_logo_url":"//cdn.example.com/logo-mini.png",
      "email_logo_url":"//cdn.example.com/logo-mini.png",
      "favicon_url":"//cdn.example.com/logo-mini.png",
      "terms_of_usage_url":"https://www.example.com/tou/",
      "privacy_policy_url":"https://www.example.com/privacy-policy/",
      "imprint_url":"https://www.example.com/legal-disclosure/",
      "mailchimp_list_id":"{{mailchimp_list_id}}",
      "mandrill_email_from":"foo@foo.bar",
      "hide_repos":false,
      "hide_teams":false,
      "hide_ssh_keys":false,
      "hide_api_key":false,
      "hide_docs":false,
      "hide_register":false,
      "powered_by_elasticio":true,
      "docs_base_url":"https://docs.example.com/",
      "component_docs_base_url":"https://docs.example.com/components/",
      "ssl_certificates":{},
      "email_templates":{
        "agent-request": true,
        "contract-deleted": true,
        "contract-invite-empty-contract": true,
        "contract-invite-new-user": true,
        "contract-suspended": true,
        "contract-unsuspended": true,
        "password-recovery": true,
        "repo-new-version": false,
        "repo-new-version-in-workspace-flows": false,
        "task-error-notification": true,
        "task-operational-error": true,
        "team-from-contract-invite": true,
        "team-removed-member": true,
        "user-removed-from-contract": true,
        "wiper-exhaustion-quota-notification": true,
        "wiper-flow-suspended-due-to-queue-overflow": true,
        "wiper-stop-limited-flow": true,
        "wiper-suspended-queue-purged": true,
        "workspace-invite-empty-workspace": true,
        "workspace-invite-new-user": true,
        "workspace-removed": true,
        "workspace-removed-member": true
      },
     "custom_nav_menu_items":[
        {
          "title":"Catalogs",
          "icon":"catalog-icon",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://flow-catalog.example.com",
              "title":"Flow catalog",
              "icon":"flow-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            },
            {
              "url":"https://components-catalog.example.com?workspaceId={workspaceId}&contractId={contractId}",
              "title":"Components catalog",
              "icon":"components-catalog-icon",
              "custom_class":"custom_class",
              "target":"modal"
            }
          ]
        },
        {
          "title":"Quick Help",
          "icon":"help",
          "custom_class":"custom_class",
          "links":[
            {
              "url":"https://docs.example.com",
              "title":"Documentation",
              "icon":"description",
              "target":"_blank"
            },
            {
              "title":"Help Center",
              "icon":"forum",
              "custom_class":"intercom-launcher"
            }
          ]
        }
      ],
      "feature_flags":{
        "old_mapper_enabled":false
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/`

#### Authorization

This request is authorized for the users with the `tenants.tenant.get` permission.

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

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

This resource allows you to delete a **Tenant** with the given ID along with everything it includes.

_A Tenant will be deleted only if it does not contain any contracts_

### HTTP Request

`DELETE {{ api_base_url }}/v2/tenants/{TENANT_ID} \`

#### Authorization

This request is authorized for the users with the `tenants.tenant.delete` permission.

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

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

This resource allows you to retrieve all roles for a **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

This request is authorized for the users with the `tenants.tenant.list_roles` permission.

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

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
        "global.stats.workspaces",
        "contracts.contract.edit",
        "contracts.devTeam.edit",
        "contracts.membership.edit",
        "contracts.repository.edit",
        "contracts.workspace.create",
        "contracts.workspace.delete",
        "contracts.workspace.listAll",
        "contracts.workspace_limits.edit",
        "global.auth_clients.create",
        "global.auth_clients.delete",
        "global.auth_clients.edit",
        "global.auth_clients.get",
        "workspaces.auth_secret.create",
        "workspaces.auth_secret.delete",
        "workspaces.auth_secret.edit",
        "workspaces.auth_secret.get",
        "workspaces.auth_secret.get_credentials",
        "workspaces.auth_secret.refresh",
        "workspaces.credential.edit",
        "workspaces.flow.edit",
        "workspaces.flow.exportToRecipe",
        "workspaces.flow.toggleRealtime",
        "workspaces.flow.toggleStatus",
        "workspaces.logs.read_all",
        "workspaces.recipe.edit",
        "workspaces.topic.create",
        "workspaces.topic.delete",
        "workspaces.topic.edit",
        "workspaces.topic.get",
        "workspaces.vpn_agent.create",
        "workspaces.vpn_agent.delete",
        "workspaces.vpn_agent.edit",
        "workspaces.vpn_agent.get",
        "workspaces.vpn_agent.get_config",
        "workspaces.workspace.edit"
      ]
    }
  },
  "meta":{}
}
```

This endpoint returns all available permissions required for creating a role.

### HTTP Request

`GET {{ api_base_url }}/v2/permissions`

#### Authorization

This endpoint is available to all the platforms' users. However, it does not list _service permissions_ that are only available to _Service Accounts_.
The list of _service permissions_ is in the following table.

| Permission                                | Description                                                                                                                            |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `global.flow.get_limited_to_stop`         | Select flows that need to be stopped in limited Workspaces. Flow lifetime period is defined in the corresponding environment variable. |
| `global.quota_limits.edit`                |Set or update quota limits.|
| `global.contract.contract.list_all`       |List all contracts|
| `global.workspace.get_all`                |List all Workspaces|
| `tenants.user.create`                     | Create users in a Tenant.|
| `tenants.user.delete`                     | Remove users from a Platform.|
| `tenants.user.list_all`                   | List all users of a Tenant.|
| `tenants.user.get`                        | Get users by ID in a Tenant.|
| `tenants.tenant.edit`                     | Edit the Tenant.|
| `tenants.tenant.edit_roles`               | Edit roles in a Tenant. |
| `tenants.tenant.list_roles`               | Get the list of roles in a Tenant.|
| `tenants.tenant.create`                   | Create Tenants.|
| `tenants.tenant.delete`                   | Delete Tenants.|
| `tenants.tenant.get`                      | Get Tenants by ID.|
| `tenants.contract.create`                 | Create Contracts in a Tenant.|
| `tenants.membership.edit`                 | Grant or remove _Tenant Admin_ role to Platform users. |
| `tenants.certificate.get_encrypted`       | Get certificate and key in encrypted form.|
| `tenants.certificate.get_info`            | Get certificate metadata.  |
| `tenants.certificate.create`              | Create certificates. |
| `tenants.certificate.edit`                | Edit certificates.|
| `tenants.certificate.delete`              | Delete certificates.|
| `tenants.oauth_clients.get`               | Get a list of Oauth clients in a Tenant.|
| `tenants.oauth_clients.edit`              | Edit Oauth clients in a Tenant. |
| `tenants.oauth_clients.create`            | Create Oauth clients in a Tenant.|
| `tenants.oauth_clients.delete`            | Delete Oauth clients in a Tenant. |
| `contracts.contract.get`                  | Get Contracts by ID.|
| `contracts.contract.edit_available_roles` | Edit available roles in a Contracts. |
| `contracts.membership.edit_directly`      | Edit user membership by ID. |
| `contracts.contract.delete`               | Delete Contracts. |
| `contracts.contract.finish_delete`        | Stop all flows to delete the Contract.|
| `contracts.contract.finish_suspend`       | Stop all flows to suspend the Contract. |
| `contracts.contract.suspend`              | Request Contract suspension. |
| `contracts.contract.unsuspend`            | Request Contract unsuspension.|
| `contracts.contract.listAll`              | Get list of all contracts **(Work in Progress!)**.|
| `contracts.contract.list_blocking_tasks`  | List blocking tasks in the Contract.|
| `contracts.devTeam.edit_access`           | Change repository access level.|
| `workspaces.workspace.edit_type`          | Edit workspace type. |
| `workspaces.workspace.finish_delete`      | Stop all flows to delete the Workspace. |

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

This resource allows you to update the roles for a **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

This request is authorized for the users with the `tenants.tenant.edit_roles` permission.

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

### Payload Parameters

| Parameter                                 | Required | Description  |
| ----------------------------------------- | -------- | ------------------- |
| type                                      | yes      | A value should be "tenant-policy"|
| attributes.roles\[]                       | yes      | An array of Tenant's roles. It can be empty.  |
| attributes.roles\[].role                  | no       | Name of a role. |
| attributes.roles\[].scope                 | no       | The group of objects, which is affected by this role. Value can be "contracts" or "workspaces"  |
| attributes.roles\[].permissions\[]        | yes      | An array of permissions. It can be empty. To get the list of available permissions execute [Get the list of available permissions](<{{ api_base_url }}/docs/v2/#get-the-list-of-available-permissions>) endpoint |
| attributes.roles\[].i18n.{{language_key}} | no       | The name of a role in different languages. The value is only required for "en" key. For other languages value is optional|

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

This resource allows you to create a new **SSL certificate**.

### HTTP Request

`POST {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates`

#### Authorization

This request is authorized for the users with the `tenants.certificate.create` permission.

### Payload Parameters

| Parameter             | Required | Description     |
| --------------------- | -------- | --------------- |
| attributes.publicKey  | yes      | CERTIFICATE     |
| attributes.privateKey | yes      | RSA PRIVATE KEY |

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

### Returns

Returns **SSL certificate** object if the call succeeded

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

This resource allows you to retrieve a **SSL certificate** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID}`

### URL Parameters

| Parameter      | Description               |
| -------------- | ------------------------- |
| TENANT_ID      | The ID of the Tenant      |
| CERTIFICATE_ID | The ID of the Certificate |

#### Authorization

This request is authorized for the users with the `tenants.certificate.get_encrypted` and/or `tenants.certificate.get_info` permissions.

### Returns

Returns **SSL certificate** object if the call succeeded

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

This resource allows you to update a **SSL certificate** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID}`

#### Authorization

This request is authorized for the users with the `tenants.certificate.edit` permission.

### URL Parameters

| Parameter      | Description               |
| -------------- | ------------------------- |
| TENANT_ID      | The ID of the Tenant      |
| CERTIFICATE_ID | The ID of the Certificate |

### Payload Parameters

| Parameter             | Required | Description     |
| --------------------- | -------- | --------------- |
| attributes.publicKey  | yes      | CERTIFICATE     |
| attributes.privateKey | yes      | RSA PRIVATE KEY |

### Returns

Returns **SSL Certificate** object if the call succeeded

## Delete Certificate

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a **SSL certificate** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`DELETE {{ api_base_url }}/v2/tenants/{TENANT_ID}/certificates/{CERTIFICATE_ID} \`

#### Authorization

This request is authorized for the users with the `tenants.certificate.delete` permission.

### URL Parameters

| Parameter      | Description               |
| -------------- | ------------------------- |
| TENANT_ID      | The ID of the Tenant      |
| CERTIFICATE_ID | The ID of the Certificate |

### Returns

Responds with the `204 No content` message if the call succeeded (with empty body).

## Granting Tenant Admin's permissions to the User

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "tenant-member",
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

This endpoint allows you to grant Tenant Admin's permissions to the **User** with the given ID in the **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/`

#### Authorization

This request is authorized for the users with the `tenants.membership.edit` permission.

### URL Parameters

| Parameter | Description                      |
| --------- | -------------------------------- |
| TENANT_ID | The ID of the Tenant             |
| USER_ID   | The ID of the user to be updated |

### Payload Parameters

| Parameter           | Required | Description                            |
| ------------------- | -------- | -------------------------------------- |
| type                | yes      | A value should be the "tenant-member". |
| attributes.roles\[] | yes      | A value should be the "tenant-admin".  |

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

This endpoint allows you to remove Tenant Admin's permissions from the **User** with the given ID in the **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/members/{USER_ID}/`

#### Authorization

This request is authorized for the users with the `tenants.membership.edit` permission.

### URL Parameters

| Parameter | Description                      |
| --------- | -------------------------------- |
| TENANT_ID | The ID of the Tenant             |
| USER_ID   | The ID of the user to be updated |

### Payload Parameters

| Parameter           | Required | Description                            |
| ------------------- | -------- | -------------------------------------- |
| type                | yes      | A value should be the "tenant-member". |
| attributes.roles\[] | yes      | A value should be an empty array.      |

### Returns

Returns the member's object if the call succeeded

## Create an Oauth-client

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {
     "data":{
       "type":"oauth-client",
       "attributes":{
         "client_id":"{CLIENT_ID}",
         "client_secret":"{CLIENT_SECRET}"
       },
       "relationships":{
         "component":{
           "data":{
             "id":"{COMPONENT_ID}",
             "type":"component"
           }
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
    "id":"5c80e6b9bb0d200011993332",
    "type":"oauth-client",
    "attributes":{
      "client_id":"560e5a2323d480a00000002",
      "client_secret":"c7e56633-5e88-4c97-8da9-3243423412"
    },
    "relationships":{
      "component":{
        "data":{
          "id":"5a0c4f03718f9700132d88ef",
          "type":"component"
        },
        "links":{
          "self":"/v2/components/5a0c4f03718f9732197d88ef"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a new **Oauth-client**. You can create just only one oauth-client for a component per tenant.

### HTTP Request

`POST {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients`

#### Authorization

This request is authorized for the users with the `tenants.oauth_clients.create` permission.

### Payload Parameters

| Parameter                         | Required | Description                      |
| --------------------------------- | -------- | -------------------------------- |
| type                              | yes      | A value should be "oauth-client" |
| attributes.client_id              | yes      | Oauth-client ID                  |
| attributes.client_secret          | yes      | Oauth-client secret              |
| relationships.component.data.id   | yes      | Component ID                     |
| relationships.component.data.type | yes      | A value should be "component"    |

### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

### Returns

Returns **Oauth-client** object if the call succeeded

## Retrieve an Oauth-client

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients \
   -u {EMAIL}:{APIKEY}
```

> Example Request (with filter):

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/?filter[component]={{COMPONENT_ID}} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id":"5c80e6b9bb0d200011333d92",
      "type":"oauth-client",
      "attributes":{
        "client_id":"560e5a27734d423233200002",
        "client_secret":"c7e56633-5e88-4c97-8da9-f823432423"
      },
      "relationships":{
        "component":{
          "data":{
            "id":"5a0c4f03718f9700197328ef",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/5a0c4f03718f97232397d88ef"
          }
        }
      }
    },
    {
      "id":"5c7d0c362bcf5d0011323b44",
      "type":"oauth-client",
      "attributes":{
        "client_id":"560e5a27734d4802131200001",
        "client_secret":"c7e56633-5e88-4c97-8da9-f821232311"
      }
    }
  ],
  "meta":{}
}
```

This resource allows you to retrieve **Oauth-clients** for the **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients`

### URL Parameters

| Parameter         | Required | Description            |
| ----------------- | -------- | ---------------------- |
| TENANT_ID         | yes      | The ID of the Tenant   |
| filter[component] | no       | Filter by component_id |

#### Authorization

This request is authorized for the users with the `tenants.oauth_clients.get` permission.

### Returns

Returns **Oauth-client** object if the call succeeded

## Retrieve an Oauth-client by id

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"5c80e6b9bb0d200033993d92",
    "type":"oauth-client",
    "attributes":{
      "client_id":"560e5a27734d480a23424302",
      "client_secret":"c7e56633-5e88-4c97-8da9-f82232439d4a7"
    },
    "relationships":{
      "component":{
        "data":{
          "id":"5a0c4f03718f9700197d88ef",
          "type":"component"
        },
        "links":{
          "self":"/v2/components/5a0c4f03718f934134ef"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a **Oauth-client** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID}`

### URL Parameters

| Parameter       | Required | Description                |
| --------------- | -------- | -------------------------- |
| TENANT_ID       | yes      | The ID of the Tenant       |
| OAUTH-CLIENT_ID | yes      | The ID of the Oauth-client |

#### Authorization

This request is authorized for the users with the `tenants.oauth_clients.get` permission.

### Returns

Returns **Oauth-client** object if the call succeeded

## Update an Oauth-client

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {
     "data":{
       "type":"oauth-client",
       "attributes":{
         "client_id":"{CLIENT_ID}",
         "client_secret":"{CLIENT_SECRET}"
       },
       "relationships":{
         "component":{
           "data":{
             "id":"{COMPONENT_ID}",
             "type":"component"
           }
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
  "data":{
    "id":"5c80e6b9bb0d2000345433d92",
    "type":"oauth-client",
    "attributes":{
      "client_id":"56127089f76793453453402",
      "client_secret":"c7e56148-5e84-4c97-8da9-f82345357"
    },
    "relationships":{
      "component":{
        "data":{
          "id":"5a0c4f03718f97001345348ef",
          "type":"component"
        },
        "links":{
          "self":"/v2/components/5a0c4f03718f97435348ef"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update an **Oauth-client** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the users with the `tenants.oauth_clients.edit` permission.

### URL Parameters

| Parameter       | Description                |
| --------------- | -------------------------- |
| TENANT_ID       | The ID of the Tenant       |
| OAUTH-CLIENT_ID | The ID of the Oauth-client |

### Payload Parameters

| Parameter                         | Required | Description                      |
| --------------------------------- | -------- | -------------------------------- |
| type                              | yes      | A value should be "oauth-client" |
| attributes.client_id              | yes      | Oauth-client ID                  |
| attributes.client_secret          | yes      | Oauth-client secret              |
| relationships.component.data.id   | yes      | Component ID                     |
| relationships.component.data.type | yes      | A value should be "component"    |

### Returns

Returns **Oauth-client** object if the call succeeded

## Delete an Oauth-client

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a **Oauth-client** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`DELETE {{ api_base_url }}/v2/tenants/{TENANT_ID}/oauth-clients/{OAUTH-CLIENT_ID} \`

#### Authorization

This request is authorized for the users with the `tenants.oauth_clients.delete` permission.

### URL Parameters

| Parameter       | Description                |
| --------------- | -------------------------- |
| TENANT_ID       | The ID of the Tenant       |
| OAUTH-CLIENT_ID | The ID of the Oauth-client |

### Returns

Responds with the `204 No content` message if the call succeeded (with empty body).

## Create an OpenID Provider

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {
     "data":{
       "type":"openid-provider",
       "attributes":{
         "issuer": "{ISSUER}",
         "client_id":"{CLIENT_ID}",
         "response_type": "code",
         "client_secret":"{CLIENT_SECRET}"
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
    "id": "5c80e6b9bb0d200011333d92",
    "type": "openid-provider",
    "attributes": {
        "client_id": "c7e56633-5e88-4c97-8da9-f823432423",
        "client_secret": "c7e56633-5e88-4c97-8da9-f823432423",
        "issuer": "https://issuer.com",
        "response_type": "code",
        "config": {
            "auto_create_users": true
        }
    },
    "relationships": {
      "tenant": {
        "data": {
            "id": "5c80e6b9bb0d200011333d93",
            "type": "tenant"
        },
        "links": {
            "self": "/v2/tenants/5c80e6b9bb0d200011333d93"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a new **OpenID Provider**.

### HTTP Request

`POST {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers`

#### Authorization

This request is authorized for the users with the `tenants.tenant.edit` permission.

### Payload Parameters

| Parameter                                     | Required | Description                          |
| --------------------------------------------- | -------- | ------------------------------------ |
| type                                          | yes      | A value should be "openid-provider"    |
| attributes.issuer                             | yes      | OpenID Provider issuer                 |
| attributes.client_id                          | yes      | OpenID Provider client ID              |
| attributes.client_secret                      | yes      | OpenID Provider client secret          |
| attributes.response_type                      | no       | A value should be "code"             |
| attributes.config.auto_create_users            | no       | A value should be true or false      |


### URL Parameters

| Parameter | Description          |
| --------- | -------------------- |
| TENANT_ID | The ID of the Tenant |

### Returns

Returns **OpenID Provider** object if the call succeeded

## Retrieve an OpenID Providers

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id": "5c80e6b9bb0d200011333d92",
      "type": "openid-provider",
      "attributes": {
          "client_id": "c7e56633-5e88-4c97-8da9-f823432423",
          "client_secret": "c7e56633-5e88-4c97-8da9-f823432423",
          "issuer": "https://issuer.com",
          "response_type": "code",
          "config": {
              "auto_create_users": true
          }
      },
      "relationships": {
        "tenant": {
          "data": {
              "id": "5c80e6b9bb0d200011333d93",
              "type": "tenant"
          },
          "links": {
              "self": "/v2/tenants/5c80e6b9bb0d200011333d93"
          }
        }
      }
    }
  ],
  "meta":{}
}
```

This resource allows you to retrieve **OpenID Providers** for the **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers`

### URL Parameters

| Parameter         | Required | Description            |
| ----------------- | -------- | ---------------------- |
| TENANT_ID         | yes      | The ID of the Tenant   |

#### Authorization

This request is authorized for the users with the `tenants.tenant.get` permission.

### Returns

Returns **OpenID Provider** objects if the call succeeded

## Retrieve an OpenID Provider by ID

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers/{OPEN_ID_PROVIDER_ID} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id": "5c80e6b9bb0d200011333d92",
    "type": "openid-provider",
    "attributes": {
        "client_id": "c7e56633-5e88-4c97-8da9-f823432423",
        "client_secret": "c7e56633-5e88-4c97-8da9-f823432423",
        "issuer": "https://issuer.com",
        "response_type": "code",
        "config": {
            "auto_create_users": true
        }
    },
    "relationships": {
      "tenant": {
        "data": {
            "id": "5c80e6b9bb0d200011333d93",
            "type": "tenant"
        },
        "links": {
            "self": "/v2/tenants/5c80e6b9bb0d200011333d93"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a **OpenID Provider** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers/{OPEN_ID_PROVIDER_ID}`

### URL Parameters

| Parameter        | Required | Description                 |
| ---------------- | -------- | --------------------------- |
| TENANT_ID        | yes      | The ID of the Tenant        |
| OPEN_ID_PROVIDER_ID | yes      | The ID of the OpenID Provider |

#### Authorization

This request is authorized for the users with the `tenants.tenant.get` permission.

### Returns

Returns **OpenID Provider** object if the call succeeded

## Update an OpenID Provider

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers/{OPEN_ID_PROVIDER_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {
     "data":{
       "type":"openid-provider,
       "attributes":{
         "issuer": "{ISSUER}"
         "client_id":"{CLIENT_ID}",
         "client_secret":"{CLIENT_SECRET}",
         "config": {
           "auto_create_users": true
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
  "data":{
    "id": "5c80e6b9bb0d200011333d92",
    "type": "openid-provider",
    "attributes": {
        "client_id": "c7e56633-5e88-4c97-8da9-f823432423",
        "client_secret": "c7e56633-5e88-4c97-8da9-f823432423",
        "issuer": "https://issuer.com",
        "response_type": "code",
        "config": {
            "auto_create_users": true
        }
    },
    "relationships": {
      "tenant": {
        "data": {
            "id": "5c80e6b9bb0d200011333d93",
            "type": "tenant"
        },
        "links": {
            "self": "/v2/tenants/5c80e6b9bb0d200011333d93"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update an **OpenID Provider** with the given ID for the **Tenant** with the given ID.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/openid/providers/{OPEN_ID_PROVIDER_ID}`

#### Authorization

This request is authorized for the users with the `tenants.tenant.edit` permission.

### URL Parameters

| Parameter        | Required | Description                 |
| ---------------- | -------- | --------------------------- |
| TENANT_ID        | yes      | The ID of the Tenant        |
| OPEN_ID_PROVIDER_ID | yes      | The ID of the OpenID Provider |

### Payload Parameters

| Parameter                                     | Required | Description                      |
| --------------------------------------------- | -------- | -------------------------------- |
| type                                          | yes      | A value should be "openid-provider"    |
| attributes.issuer                             | no       | OpenID Provider issuer                 |
| attributes.client_id                          | no       | OpenID Provider client ID              |
| attributes.client_secret                      | no       | OpenID Provider client secret          |
| attributes.response_type                      | no       | A value should be "code"             |
| attributes.config.auto_create_users | no       | A value should be true or false      |

### Returns

Returns **Oauth-client** object if the call succeeded


## List of emails sent by the Platform
The Platform sends various emails when triggered. Here is the list of templates that you can customize:

- **agent-request** Agent has been requested
- **contract-deleted** Contract has been deleted
- **contract-invite-empty-contract** New user has been invited to an empty Contract
- **contract-invite-new-user** New user has been invited to the Contract
- **contract-suspended** Contract has been suspended
- **contract-unsuspended** Contract has been unsuspended
- **password-recovery** Password recovery has been requested
- **repo-new-version** New Component version has been pushed in your Developer Team
- **repo-new-version-in-workspace-flows** New Component version has been pushed, Component used in your Flows
- **task-error-notification** A Component has reported an error
- **task-operational-error** A container has failed
- **team-from-contract-invite** Has invited to contract's team
- **team-removed-member** Team member has been removed
- **user-removed-from-contract** Has removed user from contract
- **wiper-exhaustion-quota-notification** Quota usage has come to the limit
- **wiper-flow-suspended-due-to-queue-overflow** Flow has been suspended due to queue overflow
- **wiper-stop-limited-flow** Flow has been stopped due to limitations of limited workspace
- **wiper-suspended-queue-purged** Unhandled data has been purged
- **workspace-invite-empty-workspace** User has been invited to an empty Workspace
- **workspace-invite-new-user** Unregistered user has been invited to the Workspace
- **workspace-removed** Workspace has been removed
- **workspace-removed-member** Member has been removed from the Workspace
