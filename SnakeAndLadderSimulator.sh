#!/bin/bash -x

echo "/******************************************* WELCOME TO SNAKE AND LADDER SIMULATOR *******************************************/"

# CONSTANTS
START_POSITION=0
WIN_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLES
NumberOfPlayer=1
playerPosition=$START_POSITION
dieLimit=6
optionsLimit=3
rollDieValue=0
rollCount=0

# FUNCTION TO GET RANDOM VALUE
function random(){
	local input=$1
	local randomValue=$((1+RANDOM%$input))
echo $randomValue
}

# FUNCTION TO CHECK FOR OPTIONS OF GAME
function checkOption(){
	((rollCount++))
	rollDieValue=$( random $dieLimit)
	echo "Dice Rolled Result $rollDieValue"
	local choice=$( random $optionsLimit )
	case $choice in
		$NO_PLAY)
			playerPosition=$playerPosition
					;;
		$LADDER)
			playerPosition=$(($playerPosition+$rollDieValue))
					;;
		$SNAKE)
			playerPosition=$(($playerPosition-$rollDieValue))
					;;
	esac
}

# LOOP FOR REPEATING TILL PLAYER REACHES THE EXACT WINNING POSITION
while [[ $playerPosition -ne $WIN_POSITION ]]
do
	if [ $playerPosition -lt $START_POSITION ]
	then
		playerPosition=$START_POSITION
	elif [ $playerPosition -gt $WIN_POSITION ]
	then
		playerPosition=$(($playerPosition-$rollDieValue))
	fi
	checkOption
	echo "Current player Position is $playerPosition"
done

# DISPLAYING NUMBER OF TIMES DICE ROLLED
echo "Total number of times dice rolled: $rollCount"

