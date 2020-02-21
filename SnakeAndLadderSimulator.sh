#!/bin/bash -x

echo "/******************************************* WELCOME TO SNAKE AND LADDER SIMULATOR *******************************************/"

# CONSTANT
START_POSITION=0

#VARIABLE
NumberOfPlayer=1
rollDieValue=0

# FUNCTION TO GET RANDOM VALUE
function random(){
	local randomValue=$((1+RANDOM%6))
echo $randomValue
}
rollDieValue=$( random )
