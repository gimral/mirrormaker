FROM openjdk:8u212-jre-alpine

RUN apk add --no-cache ca-certificates bash

COPY kafka_2.13-2.7.0.tgz .

RUN mkdir /opt/kafka; \
    tar xzf kafka_2.13-2.7.0.tgz --strip-components=1 -C /opt/kafka; \
    rm kafka_2.13-2.7.0.tgz

COPY mm2.properties /opt/kafka/config/
COPY run.sh /opt/kafka/

#RUN chmod g+rwX /opt/kafka
RUN chmod 777 /opt/kafka
RUN chmod a+x /opt/kafka/run.sh

WORKDIR /opt/kafka

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["./run.sh"]