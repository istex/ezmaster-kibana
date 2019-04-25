FROM docker.elastic.co/kibana/kibana:6.7.0

COPY kibana.yml /usr/share/kibana/config/

# Then create the /etc/ezmaster.json in your docker image.
# It will tell to ezmaster where is your web server (ex: port 3000),
# where is your JSON configuration file,
# and where is your data folder
# "configType" value can be "json" or "text" depending on your config format
COPY ezmaster.json /etc/

EXPOSE 5601

ENV XPACK_SECURITY_ENABLED false
ENV XPACK_GRAPH_ENABLED false
ENV XPACK_ML_ENABLED false
ENV XPACK_REPORTING_ENABLED false

ENV ES_TMPDIR /usr/share/kibana/tmp
RUN mkdir ${ES_TMPDIR}
ENV JAVA_OPTS "-Djava.io.tmpdir=${ES_TMPDIR} ${JAVA_OPTS}"

# WORKDIR /
# COPY docker-entrypoint.overload.sh /usr/local/bin/
# ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.overload.sh" ]

ENTRYPOINT [ "/usr/local/bin/kibana-docker" ]