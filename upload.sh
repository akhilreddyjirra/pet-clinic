#!/bin/bash
ls *deb > debs.txt
curl -u $admin:$password --upload-file debs.txt http://139.59.74.184/nexus/repository/prox-x/frontend/$verision/

for i in $(pwd)/*.deb
do
    curl -u $admin:$password --upload-file "${i##*/}" http://139.59.74.184/nexus/repository/prox-x/frontend/$verision/
done
