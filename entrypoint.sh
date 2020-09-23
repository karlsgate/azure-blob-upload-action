#!/bin/sh

set -e

if [ -z "${INPUT_SOURCE_DIRECTORY}" ]; then
  echo "source_directory parameter is required"
  exit 1
fi

if [ -z "${INPUT_CONTAINER_NAME}" ]; then
  echo "container_name parameter is required"
  exit 1
fi

if [ -z "${INPUT_CONNECTION_STRING}" ]; then
  echo "connection_string parameter is required"
  exit 1
fi

OPTIONAL_PATTERN=${INPUT_PATTERN:""}
if [ -z "$OPTIONAL_PATTERN" ]; then
  PATTERN_PARAM=""
else
  PATTERN_PARAM="--pattern"
fi

echo "Working from ${PWD}"
echo "Uploading ${INPUT_SOURCE_DIRECTORY} to ${INPUT_CONTAINER_NAME} ..."
az storage blob upload-batch --connection-string ${INPUT_CONNECTION_STRING} --source ${INPUT_SOURCE_DIRECTORY} --destination ${INPUT_CONTAINER_NAME} ${PATTERN_PARAM} ${OPTIONAL_PATTERN}
