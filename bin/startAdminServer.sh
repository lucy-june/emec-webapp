#!/bin/bash

export NODE_ENV=prod

pm2 delete AdminServer
if [ $# != 0 ]; then
    pm2 start admin -i $1 --name AdminServer
else
    pm2 start admin  --name AdminServer
fi
