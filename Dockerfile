FROM docker.elastic.co/kibana/kibana:6.7.0

COPY kibana.yml /usr/share/kibana/config/

# Then create the /etc/ezmaster.json in your docker image.
# It will tell to ezmaster where is your web server (ex: port 3000),
# where is your JSON configuration file,
# and where is your data folder
# "configType" value can be "json" or "text" depending on your config format
COPY ezmaster.json /etc/

EXPOSE 5601

# WORKDIR /
# COPY docker-entrypoint.overload.sh /usr/local/bin/
# ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.overload.sh" ]

RUN chmod 7111 /tmp
ENTRYPOINT [ "/usr/local/bin/kibana-docker" ]