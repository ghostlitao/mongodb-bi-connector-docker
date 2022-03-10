# Mongodb BI Connector

this docker image for mongodb-bi-connector.

## Security / Auth

This bi-connector assume that your mongodb server can connect without any authentication (trusted network).

## docker-compose example

see docker-compose.yml


## Create PEM
``` 
$ openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
```

Currently only cleartext authentication plugin is supported by Cube.js Mongo BI Driver. It requires SSL to be set up from both mongosqld and Cube.js side in order to encrypt passed credentials.

Self-signed certificate can be used to provide this encryption. It can be generated with following command:
``` 
$ openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
``` 
Concat it together to create sslPEMKeyFile:
``` 
$ cat key.pem certificate.pem > mongo.pem
``` 
Start mongosqld with enabled SSL:
``` 
$ ./mongosqld --auth --sslMode requireSSL --sslPEMKeyFile mongo.pem
``` 