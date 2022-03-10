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
    ports:
      - 3308:3308
    environment:
      MONGODB_HOST: 172.17.0.1
      MONGODB_PORT: 27017
      MONGODB_USER: root
      MONGODB_PASS: admin
      LISTEN_PORT: 3308

```


