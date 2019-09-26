# Quota Usages (Experimental)

 <aside class="warning">
 <b>The Quota Usages section is an experimental API</b>
 </aside>






## Retrieve a contract usage metrics by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}?period=2019-03 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "memory": 2245348201,
    "cpu": 768877946
  }
}
```

This endpoint allows you to retrieve a contract usage metrics by its ID. Memory usage is reported as a sum of RAM usage for each second during the specified period for each step. CPU usage is reported as an amount of consumed CPU for each step.

### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}?from={DATE_FROM}&to={DATE_TO}`

### URL Parameters

| Parameter   | Required | Description                                             |
| :---------- | :------- | :------------------------------------------------------ |
| CONTRACT_ID | Yes      | Contract identifier                                     |
| DATE_FROM   | Yes      | Start Date of the period (inclusive). Format – ISO 8601 |
| DATE_TO     | Yes      | End Date of the period (inclusive). Format – ISO 8601   |

### Authorization

Only a corresponding contract member can be authorized to send this request.

### Returns

Memory (in [MiB](https://en.wikipedia.org/wiki/Mebibyte)) and CPU (in [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu)) usage for the given Contract ID






## Retrieve a usage history for a contract

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}/history?from=2019-09-01&to=2019-10-01 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "2019-09-01",
      "memory": 3013817361,
      "cpu": 1033025938
    },
    {
      "id": "2019-09-02",
      "memory": 1175586955,
      "cpu": 1228829840
    },
    {
      "id": "2019-09-03",
      "memory": 1415099916,
      "cpu": 914085387
    },
    {
      "id": "2019-09-04",
      "memory": 4333364932,
      "cpu": 905498466
    },
    {
      "id": "2019-09-05",
      "memory": 3103767554,
      "cpu": 1435640133
    },
    {
      "id": "2019-09-06",
      "memory": 4438218529,
      "cpu": 1312683914
    },
    {
      "id": "2019-09-07",
      "memory": 3115617368,
      "cpu": 1273318310
    },
    {
      "id": "2019-09-08",
      "memory": 2555583930,
      "cpu": 425826260
    },
    {
      "id": "2019-09-09",
      "memory": 1300915290,
      "cpu": 578666524
    },
    {
      "id": "2019-09-10",
      "memory": 2578000474,
      "cpu": 1200524984
    },
    {
      "id": "2019-09-11",
      "memory": 1244645541,
      "cpu": 1430851170
    },
    {
      "id": "2019-09-12",
      "memory": 3153146274,
      "cpu": 766348575
    },
    {
      "id": "2019-09-13",
      "memory": 4331061352,
      "cpu": 1524287794
    },
    {
      "id": "2019-09-14",
      "memory": 3449265869,
      "cpu": 724878805
    },
    {
      "id": "2019-09-15",
      "memory": 4380354401,
      "cpu": 681580868
    },
    {
      "id": "2019-09-16",
      "memory": 4195723875,
      "cpu": 1378873383
    },
    {
      "id": "2019-09-17",
      "memory": 2588792850,
      "cpu": 409637208
    },
    {
      "id": "2019-09-18",
      "memory": 2845001570,
      "cpu": 790312916
    },
    {
      "id": "2019-09-19",
      "memory": 3177605905,
      "cpu": 976102838
    },
    {
      "id": "2019-09-20",
      "memory": 1577592652,
      "cpu": 1237769441
    },
    {
      "id": "2019-09-21",
      "memory": 3538891088,
      "cpu": 890528854
    },
    {
      "id": "2019-09-22",
      "memory": 2186125801,
      "cpu": 605849778
    },
    {
      "id": "2019-09-23",
      "memory": 1560495801,
      "cpu": 924019694
    },
    {
      "id": "2019-09-24",
      "memory": 1457907045,
      "cpu": 935557170
    },
    {
      "id": "2019-09-25",
      "memory": 1353442520,
      "cpu": 1262766351
    },
    {
      "id": "2019-09-26",
      "memory": 3685608278,
      "cpu": 1502041477
    },
    {
      "id": "2019-09-27",
      "memory": 2866504778,
      "cpu": 1420758756
    },
    {
      "id": "2019-09-28",
      "memory": 3279678917,
      "cpu": 1458025964
    },
    {
      "id": "2019-09-29",
      "memory": 2408913650,
      "cpu": 1405853054
    },
    {
      "id": "2019-09-30",
      "memory": 3934495260,
      "cpu": 828444175
    }
  ]
}
```

This endpoint allows you to retrieve a usage history for certain `Contract`.
`id` – is a date of the day.
`memory` – is a memory usage, reported as a sum of RAM usage for a day. In [MiB](https://en.wikipedia.org/wiki/Mebibyte).
`cpu` – is CPU usage, reported as an amount of consumed CPU for a day. In [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu).


### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/contracts/{CONTRACT_ID}/history?from={DATE_FROM}&to={DATE_TO}`

### URL Parameters

| Parameter     | Required  | Description                                               |
| :----------   | :-------  | :-------------------------------------------------------- |
| CONTRACT_ID   | Yes       | Contract identifier                                       |
| DATE_FROM     | Yes       | Start Date of the period (inclusive). Format – ISO 8601   |
| DATE_TO       | Yes       | End Date of the period (not inclusive). Format – ISO 8601 |

### Authorization

Only for contract members.

### Returns

Array of contract usages per day within specified period.






## Retrieve a workspace usage metrics by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}?period=2019-03 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "memory": 2245348201,
    "cpu": 768877946
  }
}
```

This endpoint allows you to retrieve the usage metrics for a workspace by its ID. Memory usage is reported as a sum of RAM usage for each second during the specified period for each step. CPU usage is reported as an amount of consumed CPU resource for each step.

### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}?from={DATE_FROM}&to={DATE_TO}`

### URL Parameters

| Parameter    | Required | Description                                             |
| :----------- | :------- | :------------------------------------------------------ |
| WORKSPACE_ID | Yes      | Workspace identifier                                    |
| DATE_FROM    | Yes      | Start Date of the period (inclusive). Format – ISO 8601 |
| DATE_TO      | Yes      | End Date of the period (inclusive). Format – ISO 8601   |

### Authorization

Only a corresponding contract member can be authorized to send this request.

### Returns

Memory (in [MiB](https://en.wikipedia.org/wiki/Mebibyte)) and CPU (in [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu)) usage for the given Workspace ID






## Retrieve a usage history for a workspace

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/workspace/{WORKSPACE_ID}/history?from=2019-09-01&to=2019-10-01 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "2019-09-01",
      "memory": 128964526,
      "cpu": 114306500
    },
    {
      "id": "2019-09-02",
      "memory": 408936660,
      "cpu": 79852852
    },
    {
      "id": "2019-09-03",
      "memory": 386725520,
      "cpu": 125872319
    },
    {
      "id": "2019-09-04",
      "memory": 193675746,
      "cpu": 92099164
    },
    {
      "id": "2019-09-05",
      "memory": 177530397,
      "cpu": 43157955
    },
    {
      "id": "2019-09-06",
      "memory": 353733337,
      "cpu": 109371060
    },
    {
      "id": "2019-09-07",
      "memory": 144626872,
      "cpu": 85429328
    },
    {
      "id": "2019-09-08",
      "memory": 272579360,
      "cpu": 143888954
    },
    {
      "id": "2019-09-09",
      "memory": 185053387,
      "cpu": 135083221
    },
    {
      "id": "2019-09-10",
      "memory": 209892504,
      "cpu": 118582342
    },
    {
      "id": "2019-09-11",
      "memory": 290143226,
      "cpu": 55125590
    },
    {
      "id": "2019-09-12",
      "memory": 303180124,
      "cpu": 94330986
    },
    {
      "id": "2019-09-13",
      "memory": 300608414,
      "cpu": 151294431
    },
    {
      "id": "2019-09-14",
      "memory": 180244867,
      "cpu": 140865929
    },
    {
      "id": "2019-09-15",
      "memory": 187069283,
      "cpu": 109569827
    },
    {
      "id": "2019-09-16",
      "memory": 439170195,
      "cpu": 151515652
    },
    {
      "id": "2019-09-17",
      "memory": 323928269,
      "cpu": 39417483
    },
    {
      "id": "2019-09-18",
      "memory": 205336814,
      "cpu": 120806191
    },
    {
      "id": "2019-09-19",
      "memory": 310188765,
      "cpu": 110638121
    },
    {
      "id": "2019-09-20",
      "memory": 382909571,
      "cpu": 75652523
    },
    {
      "id": "2019-09-21",
      "memory": 307170731,
      "cpu": 95998011
    },
    {
      "id": "2019-09-22",
      "memory": 116159302,
      "cpu": 135483445
    },
    {
      "id": "2019-09-23",
      "memory": 141174486,
      "cpu": 127318996
    },
    {
      "id": "2019-09-24",
      "memory": 150589801,
      "cpu": 86755184
    },
    {
      "id": "2019-09-25",
      "memory": 219903014,
      "cpu": 91103923
    },
    {
      "id": "2019-09-26",
      "memory": 140599462,
      "cpu": 47526413
    },
    {
      "id": "2019-09-27",
      "memory": 183323584,
      "cpu": 80036178
    },
    {
      "id": "2019-09-28",
      "memory": 230017864,
      "cpu": 133791324
    },
    {
      "id": "2019-09-29",
      "memory": 171331176,
      "cpu": 66413876
    },
    {
      "id": "2019-09-30",
      "memory": 289801698,
      "cpu": 95146346
    }
  ]
}
```

This endpoint allows you to retrieve a usage history for certain `Workspace`.
`id` – is a date of the day.
`memory` – is a memory usage, reported as a sum of RAM usage for a day. In [MiB](https://en.wikipedia.org/wiki/Mebibyte).
`cpu` – is CPU usage, reported as an amount of consumed CPU for a day. In [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu).


### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}/history?from={DATE_FROM}&to={DATE_TO}`

### URL Parameters

| Parameter     | Required  | Description                                               |
| :----------   | :-------  | :-------------------------------------------------------- |
| WORKSPACE_ID  | Yes       | Workspace identifier                                      |
| DATE_FROM     | Yes       | Start Date of the period (inclusive). Format – ISO 8601   |
| DATE_TO       | Yes       | End Date of the period (not inclusive). Format – ISO 8601 |

### Authorization

For `Workspace` members or for members of the corresponding `Contract` with the permission `contracts.workspace.listAll`.

### Returns

Array of workspace usages per day within specified period.






## Retrieve a workspace usage metrics per flows

> Example Request:

```shell
curl {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}/flows?period=2019-03 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": [
        {
            "memory": 20489,
            "cpu": 3270,
            "id": "5d820965844c7d0014501089"
        },
        {
            "memory": 20454,
            "cpu": 3119,
            "id": "5d820927844c7d0014500eea"
        },
        {
            "memory": 20296,
            "cpu": 3105,
            "id": "5d81f7265301e30014ac6912"
        },
        {
            "memory": 19695,
            "cpu": 3072,
            "id": "5d820d31074a3800138853c7"
        }
    ]
}
```

This endpoint allows you to retrieve the usage metrics for each flow that was active in the specified period in a certain workspace. Memory usage is reported as a sum of RAM usage for each second during the specified period for each step. CPU usage is reported as an amount of consumed CPU resource for each step.

### HTTP Request

`GET {{ api_base_url }}/v2/quota-usages/workspaces/{WORKSPACE_ID}/flows?from={DATE_FROM}&to={DATE_TO}`

### URL Parameters

| Parameter    | Required | Description                                             |
| :----------- | :------- | :------------------------------------------------------ |
| WORKSPACE_ID | Yes      | Workspace identifier                                    |
| DATE_FROM    | Yes      | Start Date of the period (inclusive). Format – ISO 8601 |
| DATE_TO      | Yes      | End Date of the period (inclusive). Format – ISO 8601   |

### Authorization

Only a corresponding workspace member can be authorized to send this request.

### Returns

Flows Id, memory (in [MiB](https://en.wikipedia.org/wiki/Mebibyte)), CPU (in [milli CPU](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#meaning-of-cpu)) usage for the given Workspace ID
