#!/bin/sh
input=$(cat "$(dirname "$0")/input.txt");

result=0;

for line in ${input[@]}; do
   cali=$(echo "$line" | grep -o '[0-9]' | head -n1);
   bration=$(echo "$line" | grep -o '[0-9]' | tail -n1);

   result=$(( $result + "$cali$bration" ))
done

echo $result
