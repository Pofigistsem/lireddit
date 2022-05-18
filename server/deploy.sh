#!/bin/bash

echo What should the version be?
read VERSION

docker build -t pofigistsem/lireddit:$VERSION .
docker push pofigistsem/lireddit:$VERSION 
ssh root@167.172.143.91 "docker pull pofigistsem/lireddit:$VERSION && docker tag pofigistsem/lireddit:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"