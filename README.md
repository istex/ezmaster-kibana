# ezmaster-kibana
EzMasterized version of Kibana

ISTEX-compliant version of Kibana for [ezmaster](https://github.com/Inist-CNRS/ezmaster). Should be used with [ezmaster-elasticsearch](https://github.com/istex/ezmaster-elasticsearch) application.

## Parameters

Parameters are default ones of Kibana except `network.host` which is set to `0.0.0.0`

Customizable configuration file is [kibana.yml](./kibana.yml). You will probably have to set `elasticsearch.hosts` parameter to point to your elasticsearch cluster.
