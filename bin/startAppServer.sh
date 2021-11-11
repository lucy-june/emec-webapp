#!/bin/bash

export NODE_ENV=prod

pm2 delete AppServer
if [ $# != 0 ]; then
    pm2 start app -i $1 --name AppServer
else
    pm2 start app  --name AppServer
fi