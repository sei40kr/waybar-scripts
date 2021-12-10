#!/usr/bin/env bash

playerctl -Fs status | while read -r status; do
  if [[ "$status" == 'Stopped' ]]; then
    echo '{"alt":"stopped","class":"stopped"}'
  else
    playerctl -f $'{{lc(status)}}\n{{title}}\n{{artist}}' -s metadata | {
      read -r status
      read -r title
      read -r artist
      echo "{\"text\":\"${title}${artist:+${SEPARATOR}${artist}}\",\"alt\":\"${status}\",\"class\":\"${status}\"}"
    }
  fi
done
