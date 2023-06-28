#!/bin/bash

if [ -z "$1" ]
then
  echo "\$1 is empty"
  exit 1
else
  echo "Path source workspace : ${1}"
fi

if [ -z "$2" ]
then
  echo "\$2 is empty"
  exit 1
else
  echo "Path destination workspace : ${2}"
fi

SOURCE_WORKSPACE="${1}"
DESTINATION_WORKSPACE="${2}"
ENV_JSON_FILE="${SOURCE_WORKSPACE}/env.json"
ENV_FILE="${DESTINATION_WORKSPACE}/env.yaml"

echo "Path workspace source env.json : ${ENV_JSON_FILE}"

env=$(cat env.json | jq '{env :.data}' | yq -P)
echo "${env}" > "$ENV_FILE"