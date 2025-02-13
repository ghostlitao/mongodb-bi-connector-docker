# Start from fresh debian stretch & add some tools
# note: rsyslog & curl (openssl,etc) needed as dependencies too
FROM debian:stretch
RUN apt update
RUN apt install -y rsyslog nano curl

# Setup default environment variables
ENV VERSION v2.14.3
ENV MONGODB_HOST mongodb
ENV MONGODB_PORT 27017
ENV LISTEN_PORT 3307
ENV MONGODB_USER root
ENV MONGODB_PASS admin

EXPOSE $LISTEN_PORT

# Download BI Connector to /mongosqld
WORKDIR /tmp
RUN curl https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian92-$VERSION.tgz -o bi-connector.tgz && \
    tar -xvzf bi-connector.tgz && rm bi-connector.tgz && \
    mv /tmp/mongodb-bi-linux-x86_64-debian92-$VERSION /mongosqld



# Start Everything
# note: we need to use sh -c "command" to make rsyslog running as deamon too
RUN service rsyslog start
# --logPath /var/log/mongosqld.log



CMD sh -c "/mongosqld/bin/mongosqld --mongo-uri mongodb://$MONGODB_HOST:$MONGODB_PORT/?connect=direct --auth -u $MONGODB_USER -p $MONGODB_PASS --mongo-authenticationSource admin --addr 0.0.0.0:$LISTEN_PORT --sslMode requireSSL --sslPEMKeyFile /tmp/mongo.pem --sampleNamespaces 'mdworksheet.*' --sampleNamespaces 'mdwsrows.*' --sampleSize 10000"
