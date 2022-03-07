#!/bin/bash

[ -z $1 ] && echo "Argument NOT FOUND." && exit 1
[ ! -f $1 ] && echo "File \"${1}\" DOES NOT exists." && exit 1

while read -r READ_NUM || [ -n "$READ_NUM" ]    # Read every line, Assign the line value to READ_NUM
do
    STARS=""                                    # Will contain READ_NUM amount stars
    COUNTER=0                                   # COUNTER to reach the COUNTER_NUM
    while [ $COUNTER -ne $READ_NUM ]            # Do until COUNTER equal to COUNT_NUM
    do
        STARS="${STARS}*"                       # String concatation
        ((COUNTER++))                           # 
    done
    
    echo "$STARS"                               # Print STARS
done < $1                                       # Read the file given
