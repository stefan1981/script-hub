#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${RED}$(kubens -c)${NC}\n"

status () {
  if [[ $(kubectl get $1 2>&1) != *"No resources"*  ]]; then
    printf "\n${GREEN}--- $1 ${NC}\n"
    kubectl get $1 -o wide
  fi
}

status pods
status deployments
status statefulsets
status replicasets
status cronjob
status job
status service
#status endpoints
status configmaps
status secrets
status persistentvolumeclaim
#status persistentvolume
#status serviceaccount

