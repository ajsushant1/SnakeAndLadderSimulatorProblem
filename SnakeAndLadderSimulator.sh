#!/bin/bash -x

echo "/******************************************* WELCOME TO SNAKE AND LADDER SIMULATOR *******************************************/"

# CONSTANTS
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLES
NumberOfPlayer=1
playerPosition=$START_POSITION
dieLimit=6
optionsLimit=3
rollDieValue=0

# FUNCTION TO GET RANDOM VALUE
function random(){
	local input=$1
	local randomValue=$((1+RANDOM%$input))
echo $randomValue
}

# TO GET ROLLED DICE VALUE
rollDieValue=$( random $dieLimit)

# FUNCTION TO CHECK FOR OPTIONS OF GAME
function checkOption(){
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

# FUNCTION CALL TO GET OPTIONS OF GAME
checkOption
