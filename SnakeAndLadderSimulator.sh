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

# FUNCTION TO GET RANDOM VALUE
function random(){
	local input=$1
	local randomValue=$((1+RANDOM%$input))
echo $randomValue
}

# FUNCTION TO CHECK FOR OPTIONS OF GAME
function checkOption(){
	rollDieValue=$( random $dieLimit)
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

# LOOP FOR REPEATING TILL PLAYER REACHES THE WINNING POSITION
while [[ $playerPosition -le $WIN_POSITION ]]
do
   if [ $playerPosition -lt $START_POSITION ]
   then
      playerPosition=$START_POSITION
   fi
   checkOption
done

