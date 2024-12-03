#!/bin/bash

read -p "Enter the day number to be generated (1-25): " day

if [[ "$day" -ge 1 && "$day" -le 25 ]]; then
  cp -rL template "$day"
else
  echo "Invalid day number. Please enter a number between 1 and 25."
fi
