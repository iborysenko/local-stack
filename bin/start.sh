#!/bin/bash

NAME=local-stack
BASE_PATH="$(
  cd "$(dirname "$0")/../" > /dev/null 2>&1 || exit
  pwd -P
)"

HELM_PATH="${BASE_PATH}/helm/"

DEBUG_VALUES=""
DEBUG_TEMPLATES=""
while [ "$1" != "" ]; do
  PARAM=$(echo $1 | awk -F= '{print $1}')
  case $PARAM in
  --dep-update)
    helm dependency update "$HELM_PATH"
    ;;
  --debug-values)
    DEBUG_VALUES=--debug
    ;;
  --debug-templates)
    DEBUG_TEMPLATES="true"
    ;;
  esac
  shift
done


if [ "$DEBUG_TEMPLATES" ]; then
  helm template "$HELM_PATH" \
    -f "$HELM_PATH/values.yaml" \
    -f "$HELM_PATH/values-local.yaml"
fi

helm upgrade "$NAME" "$HELM_PATH" \
  -f "$HELM_PATH/values.yaml" \
  -f "$HELM_PATH/values-local.yaml" \
  --install $DEBUG_VALUES




