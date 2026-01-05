#!/bin/bash

chown ubuntu /home/ubuntu/csc477_ws/src


exec /usr/bin/supervisord -c /etc/supervisord.conf
