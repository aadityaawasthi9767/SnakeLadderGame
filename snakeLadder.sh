#! /bin/bash 

#CONSTANTS

START=0;
FINAL=100;
NO_PLAY=0
LADDER=1;
SNAKE=2;

#ARRAY
declare -a gameBoard[100];
declare -a playerSteps[500];

#VARIABLES;
position=0;
player=0;

#echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";
function playerMovement()
{

	diceRoll=$((RANDOM%6 + 1));
	echo "Dice Roll:" $diceRoll;

	moves=$((RANDOM%3))
		case $moves in $NO_PLAY)
										echo "NO movements!";
										player=$(($player + 0));;

							$LADDER)
										playerSteps[((position++))]=$diceRoll;
										echo "Congratulations!! You encountered Ladder";
										echo "You will move up by: " $diceRoll;
										player=$(($player + $diceRoll));
										echo "New Position: " $player;;

							$SNAKE)
										playerSteps[((position++))]=$diceRoll;
										echo "Hisss!! You met Snake";
										echo "You will move down by: "$diceRoll;
										player=$(($player - $diceRoll));
										if [[ $player -le 0 ]]
                              then
                                 player=0;
											echo "New Position: " $player;
                              else
                                 echo "New Position: " $player;
                              fi;;


									*)
										echo "Wrong Play";;

		esac
}

playerMovement
