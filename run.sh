#!/bin/bash

#    *
#   >o<
#  >@>O<
# >O>o<@<
#  _| |_
TREE="ICAgXDAzM1szM20qXDAzM1swbQogIFwwMzNbMzJtPlwwMzNbMG1cMDMzWzM4OzU7MjE0bW9cMDMzWzBtXDAzM1szMm08XDAzM1swbQogXDAzM1szMm0+XDAzM1swbVwwMzNbMzFtQFwwMzNbMG1cMDMzWzMybT5cMDMzWzBtXDAzM1szNG1PXDAzM1swbVwwMzNbMzJtPFwwMzNbMG0KXDAzM1szMm0+XDAzM1swbVwwMzNbMzRtT1wwMzNbMG1cMDMzWzMybT5cMDMzWzBtXDAzM1szODs1OzIxNG1vXDAzM1swbVwwMzNbMzJtPFwwMzNbMG1cMDMzWzMxbUBcMDMzWzBtXDAzM1szMm08XDAzM1swbQogXDAzM1swbV98IHxfCg=="

msg() {
  echo -e "\033[32m$1\033[39m" >&2
}

log() {
  echo -e "\033[33m$1\033[39m" >&2
}

err() {
  echo -e "\033[31m$1\033[39m" >&2
}

year="$1"

if [ -z "$year" ]; then
  year=$(date +%Y)
fi

if [ ! -d "$year" ]; then
  err "event $year does not exist"
  exit 1
fi

echo -e "$(echo $TREE | base64 -d)"
echo
msg "Running puzzles for year $year."

days=$(ls -1 "$year" | grep '^[0-9]*$' | sort -n)

declare -A runtime_map=(
  ["u"]="umbra"
  ["cr"]="crystal"
  ["sh"]="bash"
)

should_exit_on_error=false

for day in $days; do
  for puzzle in "$year"/"$day"/part-*.*; do
    msg "Running puzzle $puzzle"

    start_time=$(date +%s)
    ${runtime_map[${puzzle##*.}]} "$puzzle"
    
    if [ $? -ne 0 ]; then
      err "failed to run puzzle $puzzle"
      should_exit_on_error=true
    fi
  
    end_time=$(date +%s)

    log "finished in $(($end_time - $start_time)) seconds."
  done
done

if [ "$should_exit_on_error" = true ]; then
  exit 1
fi
