#! /bin/bash -x

#CONSTANTS

START=0;
FINAL=100;
NO_PLAY=0
LADDER=1;
SNAKE=2;

#ARRAYS
declare -a player1Steps;
declare -a player2Steps;
declare -a countLadder;

#VARIABLES;
counterPlayer1=0;
counterplayer2=0;
player1=0;
player2=0
rapid=1;

echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";

function playerMovement(){

diceRoll=$1
while [[ $player1 -lt $FINAL || $player2 -lt $FINAL ]]
do

   moves=$((RANDOM%3))
      case $moves in $NO_PLAY)
                           echo "No MOvement";;

                     $LADDER)
                           dump=$(ladderCalling $1)
                           diceRollAgain=$((RANDOM%6 + 1));
                           trashLadder=$(playerMovement $diceRollAgain);;

                     $SNAKE)
                           trashSnake=$(snakeCalling $1)
                           switchPlayer;;
 *)
                           echo "Wrong Play";;

      esac
done
}

function playerWins(){
    if [[ $player -eq $FINAL ]]
      then
          echo "Congratulations! You WON.";
    fi
}


function player1(){
   echo "player1 turn";
   diceRoll=$((RANDOM%6 + 1));
   result=$(playerMovement $diceRoll);
   player1Steps[((counterPlayer1++))]=$diceRoll;
   playerWins

}

function player2(){
   echo "player2 turn";
   diceRoll=$((RANDOM%6 + 1));
   result=$(playerMovement $diceRoll);
#  echo "result carrying variable: " $result;
   player2Steps[((counterPlayer2++))]=$diceRoll;
   playerWins
}

function switchPlayer(){
while [[ 1 ]]
do
   switch=$((radip++%2))
	if [[ $switch -eq 0 ]]
then
      player1
   else
      player2
   fi
done
}

function ladderCalling(){

diceRoll=$1
echo "Yaayyy!! You encountered Ladder";

player=$(($player + $diceRoll));

 if [[ $player -gt $FINAL ]]
    then
       player=$(($player - $diceRoll));
       echo "You can't move to 100";
 else
       echo "You will move up by: " $diceRoll;
 fi
echo "Current position of Player: " $player;
}

function snakeCalling(){

diceRoll=$1
echo "Hisss!! You met Snake, You will move down by: " $diceRoll";
player=$(($player - $diceRoll));
if [[ $player -lt 0 ]]
   then
      player=0;
fi
echo "Current position of Player: " $player;

}


#----------------------------------------------------------------------------------------------------------------------------


switchPlayer

