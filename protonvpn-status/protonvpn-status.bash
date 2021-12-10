#!/usr/bin/env bash

protonvpn status | awk '/^Status:/ { status = tolower($2) }
  /^Server:/ { server = $2 }
  END { printf "%s\n%s\n", status, server }' | {
  read -r status
  read -r server
  if [[ "$status" == 'connected' ]]; then
    tooltip="Connected to ${server}"
  else
    tooltip='Disconnected'
  fi
  echo "{\"text\":\"${server}\",\"alt\":\"${status}\",\"class\":\"${status}\",\"tooltip\":\"${tooltip}\"}"
}
