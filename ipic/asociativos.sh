#!/bin/bash

array=(uno dos tres cuatro cinco seis siete ocho nueve diez)

counter=0

while [[ $counter -lt 10 ]]
do
echo ${array[$counter]}
((counter++))
done
