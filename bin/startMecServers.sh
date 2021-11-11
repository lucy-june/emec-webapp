#!/bin/bash

export NODE_ENV=prod

pm2 delete all
if [ $# != 0 ]; then
    pm2 start admin -i $1 --name AdminServer
    pm2 start sale  -i $1 --name SaleServer
else
    pm2 start admin  --name AdminServer
    pm2 start sale   --name SaleServer
fi
