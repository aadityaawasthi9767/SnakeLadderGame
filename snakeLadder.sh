#! /bin/bash 

#CONSTANTS
START=0;
FINAL=100;
PLAYER=1;
echo "*****************************************************WELCOME TO SNAKE AND LADDERS***********************************";
function diceThrows(){

diceRoll=$((RANDOM%6 + 1));
echo "Dice Roll:" $diceRoll;
}

diceThrows;
