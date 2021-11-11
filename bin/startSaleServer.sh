#!/bin/bash

export NODE_ENV=prod

pm2 delete SaleServer
if [ $# != 0 ]; then
    pm2 start sale -i $1 --name SaleServer
else
    pm2 start sale  --name SaleServer
fi