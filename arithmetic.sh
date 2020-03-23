#!/bin/bash -x

#Take the three inputs a,b and c
read -p "Enter the first number:" a
read -p "Enter the second number:" b
read -p "Enter the third number:" c

#Declaring dictionary
declare -A dictionary
declare -a array

#Calculate the results of arithmetic operation

function calculateTheResult()
{
	dictionary[operation1]=$((a + b * c))
	dictionary[operation2]=$((a * b + c))
	dictionary[operation3]=$((c + a / b))
	dictionary[operation4]=$((a % b + c))
}

#To print the result of all computations
function toPrintResult()
{
	echo "$a + $b * $c = ${dictionary[operation1]}"
	echo "$a * $b + $c = ${dictionary[operation2]}"
	echo "$c + $a / $b = ${dictionary[operation3]}"
	echo "$a % $b + $c = ${dictionary[operation4]}"
}

#Read the  values from dictionary into array
function dictionaryToArray()
{
	for((index=0; index<4; index++))
	do
		array[index]=${dictionary[operation$((index+1))]}
	done
echo "Elements in dictionary to array" ${array[@]}
}

#Computation result in the descending order using sorting
declare -a descendingArray
declare -a ascendingArray
function descendingArray()
{
echo -n "descending array is:"
readarray -t descendingArray < <(printf '%s\n' "${array[@]}" | sort -r --numeric-sort)
echo "${descendingArray[@]}"
}

function ascendingArray()
{
echo -n "ascending array is:"
readarray -t ascendingArray < <(printf '%s\n' "${array[@]}" | sort --numeric-sort)
echo "${ascendingArray[@]}"
}
calculateTheResult
toPrintResult
dictionaryToArray
descendingArray
ascendingArray
