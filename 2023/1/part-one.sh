#!/bin/sh
stdin=$(cat -)

result=0;

for line in ${stdin[@]}; do
   cali=$(echo "$line" | grep -o '[0-9]' | head -n1);
   bration=$(echo "$line" | grep -o '[0-9]' | tail -n1);

   result=$(( $result + "$cali$bration" ))
done

echo $result
