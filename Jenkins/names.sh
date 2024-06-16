#! /bin/bash

file=$1
cat $file | grep '.war' | cut -d: -f 2 | cut -d\" -f 2 > test.txt
echo -n "return[" > names.groovy
while read -r line
do
   echo -n "$line, " >> names.groovy
done < test.txt
echo "]" >> names.groovy
mv names.groovy /var/lib/jenkins/names.groovy
