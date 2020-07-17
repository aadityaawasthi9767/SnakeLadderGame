
#! /bin/bash 


#CONSTANTS

START=0;
FINAL=100;
NO_PLAY=0
LADDER=1;
SNAKE=2;

#ARRAYS
declare -A player1Steps;
declare -A player2Steps;

#VARIABLES;
counterPlayer1=0;
counterplayer2=0;
player1=0;
player2=0
rapid=1;

echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";

function playerMovement(){

	diceRoll=$1

	while [[ $player1 -lt $FINAL && $player2 -lt $FINAL ]]
	do
		moves=$((RANDOM%3))
      	case $moves in $NO_PLAY)
         	                  echo "No MOvement";
										player1=$(($player1 + 0 ));
										player2=$(($player2 + 0 ));;

                     	$LADDER)
                         	   ladderCalling $1
                           	diceRollAgain=$((RANDOM%6 + 1));
                           	playerMovement $diceRollAgain;;

                     	$SNAKE)
                        	   snakeCalling $1
                           	switchPlayer;;

      	esac
	 	player1=$2
      echo "Value of player1" $player1;
      player2=$3
      echo "Value of player2" $player2;
	done
}

function playerWins(){
	if [[ $switch -eq 0 ]]
	then
    	if [[ $player1 -eq $FINAL ]]
      	then
				echo $player1;
    	fi
	else
		if [[ $player2 -eq $FINAL ]]
      	then
				echo $player2;
    	fi
	fi
	echo "Congratulations! You WON.";
}

function switchPlayer(){
	while [[ 1 ]]
	do
   	switch=$((rapid++%2))
		if [[ $switch -eq 0 ]]
		then
			echo "player1 turn";
   		diceRoll=$((RANDOM%6 + 1));
   		playerMovement $diceRoll
   		player1Steps[((counterPlayer1++))]=$diceRoll;
   		playerWins

   	else
			echo "player2 turn";
   		diceRoll=$((RANDOM%6 + 1));
   		playerMovement $diceRoll
   		player2Steps[((counterPlayer2++))]=$diceRoll;
   		playerWins
   	fi
	#trash=$1
	#player1=$2
	#player2=$3

	done
}

function ladderCalling(){

	diceRoll=$1
	if [[ switch -eq 0 ]]
	then
		player1=$(($player1 + $diceRoll));
 		if [[ $player1 -gt $FINAL ]]
   	then
       	player1=$(($player1 - $diceRoll));
 		else
       	echo "You will move up by: " $diceRoll;
 		fi
 		echo "Current position of Player: " $player1;
	else
		player2=$(($player2 + $diceRoll));
   	if [[ $player2 -gt $FINAL ]]
    	then
       	player1=$(($player2 - $diceRoll));
       	echo "You can't move to 100";
   	else
       	echo "You will move up by: " $diceRoll;
   	fi
 		echo "Current position of Player: " $player2;
	fi
	playerMovement $diceRoll $player1 $player2
	#switchPlayer $diceRoll $player1 $player2
}



function snakeCalling(){

	diceRoll=$1
	if [[ $switch -eq 0 ]]
	then
		player2=$(($player2 - $diceRoll));
		if [[ $player2 -lt 0 ]]
   	then
      	player2=0;
		fi
		echo "Current position of Player: " $player2;
	else
 		player1=$(($player1 - $diceRoll));
   	if [[ $player1 -lt 0 ]]
   	then
      	player1=0;
   	fi
   	echo "Current position of Player: " $player1;
	fi
	playerMovement $diceRoll $player1 $player2
	#switchplayer $diceRoll $player1 $player2
}


#----------------------------------------------------------------------------------------------------------------------------


switchPlayer

