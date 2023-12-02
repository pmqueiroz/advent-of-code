#!/bin/sh
input=$(cat ./input.txt);
result=0;
declare -A spelled_out_digit_map=(
   ["one"]="1"
   ["two"]="2"
   ["three"]="3"
   ["four"]="4"
   ["five"]="5"
   ["six"]="6"
   ["seven"]="7"
   ["eight"]="8"
   ["nine"]="9"
);

function get_calibration {
   cali="${1:0:1}";
   bration="${1: -1}";

   echo "$cali$bration"
}

function get_valid_substrings {
   local string="$1";
   local length=${#string};
   local valid_digits="";

   for ((i = 0; i < length; i++)); do
      for ((j = i + 1; j <= length; j++)); do
         substring="${string:i:j-i}"

         if [[ "$substring" =~ ^[0-9]$ ]]; then
            valid_digits="$valid_digits$substring";
         else
            for key in "${!spelled_out_digit_map[@]}"; do
               if [[ "$substring" == "$key" ]]; then
                  valid_digits="$valid_digits${spelled_out_digit_map[$key]}";
               fi
            done
         fi
      done
   done

   echo $valid_digits;
}

for line in ${input[@]}; do
   valid_digits=$(get_valid_substrings $line)
   calibration=$(get_calibration $valid_digits);

   result=$(( $result + $calibration ))
done

echo $result
