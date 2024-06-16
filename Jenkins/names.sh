#! /bin/bash

file=$1
cat $file | grep '.war' | cut -d: -f 2 | cut -d\" -f 2 > test.txt
#cat /var/lib/jenkins/workspace/artifact/java-app/target/search_output.txt  | grep '.war' | cut -d: -f 2 | cut -d\" -f 2 > test.txt
echo -n "return[" > names.txt
while read -r line
do
   echo -n "$line, " >> names.txt
done < test.txt
echo "]" >> names.txt
mv names.txt /var/lib/jenkins/names.txt
