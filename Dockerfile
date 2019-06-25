FROM docker.elastic.co/kibana/kibana:5.5.3

COPY kibana.yml /usr/share/kibana/config/
COPY docker-entrypoint.overload.sh /usr/share/kibana/

USER root

# Then create the /etc/ezmaster.json in your docker image.
# It will tell to ezmaster where is your web server (ex: port 3000),
# where is your JSON configuration file,
# and where is your data folder
# "configType" value can be "json" or "text" depending on your config format
RUN echo '{ \
  "httpPort": 5601, \
  "configPath": "/usr/share/kibana/config/kibana.yml", \
  "configType": "text", \
  "dataPath": "/usr/share/kibana/data", \
  "technicalApplication": true \
}' > /etc/ezmaster.json

RUN chmod -R 1777 /tmp
RUN usermod -a -G root kibana

EXPOSE 5601

ENV XPACK_SECURITY_ENABLED false
ENV XPACK_GRAPH_ENABLED false
ENV XPACK_ML_ENABLED false
ENV XPACK_REPORTING_ENABLED false

WORKDIR /usr/share/kibana

ENTRYPOINT [ "./docker-entrypoint.overload.sh" ]
