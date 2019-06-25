#!/bin/bash

# start elasticsearch
chmod -R 1777 /tmp

su - kibana -c /usr/local/bin/kibana-docker $@
