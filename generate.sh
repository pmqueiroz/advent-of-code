#!/bin/bash

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
else
  echo "Invalid puzzle day number. Please enter a number between 1 and 25."
fi
