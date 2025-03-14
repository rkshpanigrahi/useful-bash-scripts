#!/bin/bash

determine_environment() {
  declare desc="If environment is not provided, determine it from hostname"
  declare given="$1"

  if [[ ":prod:stage:test:" == *":${given}:"* ]]; then
    export ENVIRONMENT="${given}"
    echo "ENVIRONMENT given as: ${ENVIRONMENT}"
    return
  fi

  # Determine environment based on hostname
  case $(hostname) in
    *prd*)
      export ENVIRONMENT="prod"
      ;;
    *stg*)
      export ENVIRONMENT="stage"
      ;;
    *)
      export ENVIRONMENT="test"
      ;;
  esac

  echo "ENVIRONMENT set to: ${ENVIRONMENT}"
}
