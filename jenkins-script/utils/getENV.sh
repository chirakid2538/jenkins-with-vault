#!/bin/bash

if [ -z "$1" ]
then
  echo "\$1 is empty"
  exit 1
else
  echo "Path env : ${1}"
fi

if [ -z "$2" ]
then
  echo "\$2 is empty"
  exit 1
else
  echo "Path workspace : ${2}"
fi

VAULT_ADDR="http://vault:8200"
VAULT_TOKEN="hvs.DkKRqWfktktrt61QaWiscYbT"
WORKSPACE="${2}"
SECRET_PATH="${1}"

echo "Path workspace .env : ${WORKSPACE}"

# Set the Vault address and token environment variables
export VAULT_ADDR="${VAULT_ADDR}"
export VAULT_TOKEN="${VAULT_TOKEN}"

# Retrieve the secret from HashiCorp Vault
# {
#   "request_id": "033912a4-43c0-af3e-36f5-df7a104b5289",
#   "lease_id": "",
#   "lease_duration": 0,
#   "renewable": false,
#   "data": {
#     "data": {
#       "VERSION": "1.0.0"
#     },
#     "metadata": {
#       "created_time": "2023-03-17T06:11:00.611484749Z",
#       "custom_metadata": null,
#       "deletion_time": "",
#       "destroyed": false,
#       "version": 1
#     }
#   },
#   "warnings": null
# }
json=$(vault kv get -format=json "${SECRET_PATH}" | jq -r '.data')
echo "${json}" > "${WORKSPACE}/env.json"
