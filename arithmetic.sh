#!/bin/bash -x

#Take the three inputs a,b and c
read -p "Enter the first number:" a
read -p "Enter the second number:" b
read -p "Enter the third number:" c

#Declaring dictionary
declare -A dict

#Calculate the results of arithmetic operation

function calculate()
{
	dict[operation1]=$((a + b * c))
}

function print()
{
	echo "$a + $b + $c = ${dict[operation1]}"
}
calculate
print
