# Mongodb BI Connector

this docker image for mongodb-bi-connector.

## Security / Auth

This bi-connector assume that your mongodb server can connect without any authentication (trusted network).

## docker-compose example

```
version: "3"
services:
 
  mongodb-bi-connector:
    image: ghostlitao/mongodb-bi-connector:latest
    environment:
      MONGODB_HOST: mongodb
      MONGODB_PORT: 27017
      MONGODB_USER: root
      MONGODB_PASS: admin

```


