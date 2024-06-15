#! /bin/bash
file=$1

cat $file | grep '.war' | cut -d: -f 2 | cut -d\" -f 2 > test.txt
echo -n "[" > names.txt
while read -r line
do
   echo -n "$line, " >> names.txt
done < test.txt
echo "]" >> names.txt

