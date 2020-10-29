#! /bin/bash

kubectl -n edge create secret generic deploy-token \
  --from-file=./token \
  --from-file=./username
