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

PATTERN_PARAM=${INPUT_PATTERN:""}
if [ -z "$PATTERN_PARAM" ]; then
  PATTERN_OPTION=""
else
  PATTERN_OPTION="--pattern"
fi

CONTENT_TYPE_PARAM=${INPUT_CONTENT_TYPE:""}
if [ -z "$CONTENT_TYPE_PARAM" ]; then
  CONTENT_TYPE_OPTION=""
else
  CONTENT_TYPE_OPTION="--content-type"
fi

OVERWRITE_PARAM=${INPUT_OVERWRITE:""}
if [ -z "$OVERWRITE_PARAM" ]; then
  OVERWRITE_OPTION=""
else
  OVERWRITE_OPTION="--overwrite"
fi

echo "Working from ${PWD}"
echo "Uploading ${INPUT_SOURCE_DIRECTORY} to ${INPUT_CONTAINER_NAME} ..."
az storage blob upload-batch --connection-string ${INPUT_CONNECTION_STRING} --source ${INPUT_SOURCE_DIRECTORY} --destination ${INPUT_CONTAINER_NAME} ${PATTERN_OPTION} ${PATTERN_PARAM} ${CONTENT_TYPE_OPTION} ${CONTENT_TYPE_PARAM} ${OVERWRITE_OPTION} ${OVERWRITE_PARAM}
