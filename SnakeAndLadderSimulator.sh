#!/bin/bash -x

echo "/******************************************* WELCOME TO SNAKE AND LADDER SIMULATOR *******************************************/"

# CONSTANTS
START_POSITION=0
WIN_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLES
playerOnePosition=$START_POSITION
playerTwoPosition=$START_POSITION
dieLimit=6
optionsLimit=3
playerOneRollDiceCount=0
playerTwoRollDiceCount=0
flag=0

# FUNCTION TO GET RANDOM VALUE
function random(){
	local input=$1
	local randomValue=$((1+RANDOM%$input))
	echo $randomValue
}

# FUNCTION TO PLAY SNAKE AND LADDER
function playSnakeAndLadder(){
	local playerPosition=$1
	local rollDieValue=$( random $dieLimit )
	local choice=$( random $optionsLimit )
	case $choice in
		$NO_PLAY)
			playerPosition=$playerPosition
					;;
		$LADDER)
			playerPosition=$(($playerPosition+$rollDieValue))
			if [ $playerPosition -gt $WIN_POSITION ]
			then
				playerPosition=$(($playerPosition-$rollDieValue))
			fi
					;;
		$SNAKE)
			playerPosition=$(($playerPosition-$rollDieValue))
			if [ $playerPosition -lt $START_POSITION ]
			then
				playerPosition=$START_POSITION
			fi
					;;
	esac
	echo $playerPosition
}

# PLAYING GAME WITH TWO PLAYERS AND FINDING WINNER PLAYER
while [[ $playerOnePosition -ne $WIN_POSITION && $playerTwoPosition -ne $WIN_POSITION ]]
do
	if [ $flag -eq 0 ]
	then
		((playerOneRollDiceCount++))
		playerOnePosition=$( playSnakeAndLadder $playerOnePosition )
		flag=1
	else
		((playerTwoRollDiceCount++))
		playerTwoPosition=$( playSnakeAndLadder $playerTwoPosition )
		flag=0
	fi
done

# DISPLAYING WINNER PLAYER AND ITS TOTAL ROLL DICE COUNT
if [ $playerOnePosition -eq $WIN_POSITION ]
then
	echo "Player One is Winner"
	echo "Player One total roll dice count is $playerOneRollDiceCount"
else
	echo "Player Two is Winner"
	echo "Player Two total roll dice count is $playerTwoRollDiceCount"
fi
