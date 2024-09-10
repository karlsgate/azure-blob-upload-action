#!/usr/bin/env bash

set -e

if [[ -z "${INPUT_SOURCE_DIRECTORY}" ]]; then
  echo "source_directory parameter is required"
  exit 1
fi

if [[ -z "${INPUT_CONTAINER_NAME}" ]]; then
  echo "container_name parameter is required"
  exit 1
fi

if [[ -z "${INPUT_CONNECTION_STRING}" ]]; then
  echo "connection_string parameter is required"
  exit 1
fi

PATTERN_OPTION=""
PATTERN_PARAM=""
if [[ -n ${INPUT_PATTERN} ]]; then
  PATTERN_OPTION="--pattern"
  PATTERN_PARAM=${INPUT_PATTERN}
fi

CONTENT_TYPE_OPTION=""
CONTENT_TYPE_PARAM=""
if [[ -n ${INPUT_CONTENT_TYPE} ]]; then
  CONTENT_TYPE_OPTION="--content-type"
  CONTENT_TYPE_PARAM=${INPUT_CONTENT_TYPE}
fi

OVERWRITE_OPTION=""
if [[ -n ${INPUT_OVERWRITE} ]]; then
  if [[ "${INPUT_OVERWRITE,,}" == "true" ]]; then
    OVERWRITE_OPTION="--overwrite true"
  elif [[ "${INPUT_OVERWRITE,,}" == "yes" ]]; then
    OVERWRITE_OPTION="--overwrite true"
  fi
fi

echo "Working from ${PWD}"
echo "Uploading ${INPUT_SOURCE_DIRECTORY} to ${INPUT_CONTAINER_NAME} ..."
az storage blob upload-batch --connection-string ${INPUT_CONNECTION_STRING} --source ${INPUT_SOURCE_DIRECTORY} --destination ${INPUT_CONTAINER_NAME} ${PATTERN_OPTION} ${PATTERN_PARAM} ${CONTENT_TYPE_OPTION} ${CONTENT_TYPE_PARAM} ${OVERWRITE_OPTION}
