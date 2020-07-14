#! /bin/bash 

#CONSTANTS


START=0;
FINAL=100;
NO_PLAY=0
LADDER=1;
SNAKE=2;

#ARRAYS
declare -a playerSteps;

#VARIABLES;
position=0;
player=0;

echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";
function playerMovement(){

while [[ $player -lt $FINAL ]]
do

	diceRoll=$((RANDOM%6 + 1));
	echo "Dice Roll:" $diceRoll;

	moves=$((RANDOM%3))
		case $moves in $NO_PLAY)
										echo "NO movements!";
										player=$(($player + 0));
										echo "Current position of Player: " $player;;

							$LADDER)
										playerSteps[((position++))]=$diceRoll;
										echo "Yaayyy!! You encountered Ladder";
										player=$(($player + $diceRoll));

										if [[ $player -gt $FINAL ]]
										then
											player=$(($player-$diceRoll));
											echo "You can't move to 100";
											echo "Current position of Player: " $player;
										else
											echo "You will move up by: " $diceRoll;
											echo "Current position of Player: " $player;
										fi
										
										echo "You get one more chance!"
										playerMovement;;

							$SNAKE)
										playerSteps[((position++))]=$diceRoll;
										echo "Hisss!! You met Snake";
										echo "You will move down by: "$diceRoll;
										player=$(($player - $diceRoll));
										if [[ $player -lt 0 ]]
                              then
                                 player=0;
											echo "Current position of Player: " $player;
										else
											echo "Current position of Player: " $player;
                              fi;;
										#switchPlayer;;


									*)
										echo "Wrong Play";;

		esac

	#echo "Current position of Player: " $player;

done
}

function playerWins(){
	 if [[ $player -eq $FINAL ]]
		then
			 echo "**************************************************************************";
          echo "You reached the 100";
          echo "Congratulations! You WON.";
    fi
playerStepsLength=${#playerSteps[@]};
echo "number of steps: " $playerStepsLength;

}

: '
function diceCountsAndPositions(){

playerStepsLength=${#playerSteps[@]};
echo "number of steps: " $playerStepsLength;
#for((index=0;index<$playerStepsLength;index++))
#do
#	echo "Dice Rolls: " ${playerSteps[index]};
#done

}

:
function player1(){
	echo "player1 turn";
	
}

'
playerMovement
playerWins
#diceCountsAndPositions
