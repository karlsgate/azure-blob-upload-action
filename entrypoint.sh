#!/bin/sh

set -e

if [ -z "${INPUT_SOURCE-DIRECTORY}" ]; then
  echo "source-directory parameter is required"
  exit 1
fi

if [ -z "${INPUT_CONTAINER-NAME}" ]; then
  echo "container-name parameter is required"
  exit 1
fi

if [ -z "${INPUT_CONNECTION-STRING}" ]; then
  echo "connection-string parameter is required"
  exit 1
fi

OPTIONAL_PATTERN=${INPUT_PATTERN:""}
if [ -z "$OPTIONAL_PATTERN" ]; then
  PATTERN_PARAM=""
else
  PATTERN_PARAM="--pattern"
fi

az storage blob upload-batch --connection-string ${INPUT_CONNECTION-STRING} --source ${INPUT_SOURCE-DIRECTORY} --destination ${INPUT_CONTAINER-NAME} ${PATTERN_PARAM} ${OPTIONAL_PATTERN} 
