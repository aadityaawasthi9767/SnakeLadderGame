#! /bin/bash 

#CONSTANTS

START=0;
FINAL=100;
NO_PLAY=0
LADDER=1;
SNAKE=2;

#ARRAYS
declare -a playerSteps[];

#VARIABLES;
position=0;
player=0;

#echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";
function playerMovement(){

while [[ $player -lt $FINAL ]]
do

	diceRoll=$((RANDOM%6 + 1));
	echo "Dice Roll:" $diceRoll;

	moves=$((RANDOM%3))
		case $moves in $NO_PLAY)
										echo "NO movements!";
										player=$(($player + 0));;

							$LADDER)
										playerSteps[((position++))]=$diceRoll;
										echo "Yaayyy!! You encountered Ladder";
										echo "You will move up by: " $diceRoll;
										player=$(($player + $diceRoll));

										if [[ $player -gt $FINAL ]]
										then
											player=100;
										else
											echo "New Position: " $player
										fi;;

							$SNAKE)
										playerSteps[((position++))]=$diceRoll;
										echo "Hisss!! You met Snake";
										echo "You will move down by: "$diceRoll;
										player=$(($player - $diceRoll));

										if [[ $player -lt 0 ]]
                              then
                                 player=0;
											echo "New Position: " $player;
                              else
                                 echo "New Position: " $player;
                              fi;;


									*)
										echo "Wrong Play";;

		esac
done
}

function playerWins(){
	 if [[ $player -eq $FINAL ]]
		then
			 echo "**************************************************************************";
          echo "You reached the 100";
          echo "Congratulations! You WON.";
    fi
}
#echo "number of steps: " ${#playerSteps[@]}


playerMovement
playerWins
