#!/bin/bash

chmod 1777 /tmp

# start elasticsearch
exec /usr/local/bin/kibana-docker $@
