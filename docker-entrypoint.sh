#!/bin/bash

#prepare run dir
mkdir -p /var/run/sshd


exec "$@"
