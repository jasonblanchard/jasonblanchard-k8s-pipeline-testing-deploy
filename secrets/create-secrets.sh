#! /bin/bash

kubectl -n edge create secret generic deploy-token \
  --from-file=./token.txt \
  --from-file=./username.txt
