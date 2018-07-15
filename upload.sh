#!/bin/bash
for i in $(pwd)/*.deb
do
    curl -u $admin:$password --upload-file "${i##*/}" http://139.59.74.184/nexus/repository/prox-x/frontend/20180714-09/

done
