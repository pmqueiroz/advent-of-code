#!/bin/bash

#    *
#   >o<
#  >@>O<
# >O>o<@<
#  _| |_
TREE="ICAgXDAzM1szM20qXDAzM1swbQogIFwwMzNbMzJtPlwwMzNbMG1cMDMzWzM4OzU7MjE0bW9cMDMzWzBtXDAzM1szMm08XDAzM1swbQogXDAzM1szMm0+XDAzM1swbVwwMzNbMzFtQFwwMzNbMG1cMDMzWzMybT5cMDMzWzBtXDAzM1szNG1PXDAzM1swbVwwMzNbMzJtPFwwMzNbMG0KXDAzM1szMm0+XDAzM1swbVwwMzNbMzRtT1wwMzNbMG1cMDMzWzMybT5cMDMzWzBtXDAzM1szODs1OzIxNG1vXDAzM1swbVwwMzNbMzJtPFwwMzNbMG1cMDMzWzMxbUBcMDMzWzBtXDAzM1szMm08XDAzM1swbQogXDAzM1swbV98IHxfCg=="

year=$(date +%Y)

read -p "Enter the event year ($year): " input_year
if [ -n "$input_year" ]; then
  year=$input_year
fi

if [ ! -d "$year"/template ]; then
  echo "template for event $year does not exist"
  exit 1
fi

last_day=$(ls -1 "$year" | grep '^[0-9]*$' | sort -n | tail -n 1)
day=$((last_day + 1))

read -p "Enter the puzzle day ($day): " input_day
if [ -n "$input_day" ]; then
  day=$input_day
fi

if [[ "$day" -ge 1 && "$day" -le 25 ]]; then
  cp -rL "$year"/template "$year"/"$day"
  echo "Puzzle $day for event $year has been created."
  echo "Happy coding!"
  echo -e "$(echo $TREE | base64 -d)"
else
  echo "Invalid puzzle day number. Please enter a number between 1 and 25."
fi
