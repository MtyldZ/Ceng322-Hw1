#!/bin/bash

MAX="?"                                                     # MAX integer value, initiated with an string
# MAX needs to be non-numeric value at start. 
# Since putting an boundry is wrong. Like setting max as 0.
# This way this script does not work with negative values.

echo "Enter a sequence of numbers followed by \"end\""      #
read INPUT                                                  # Read the entered INPUT
while [ "$INPUT" != "end" ]                                 # Do until INPUT is "end"
do
    if ! [[ $INPUT =~ ^[+-]?[0-9]+$ ]]                     # Check if INPUT is numeric integer value
    then
        echo "Enter only \"integer value\" or \"end\" to finish."   # warn user to enter integer
        read INPUT                                                  # read again
        continue
    fi

    if [ $MAX == "?" ] || [ $INPUT -gt $MAX ]               # IF it is the first integer entered or greater then MAX
    then
        ((MAX=$INPUT))                                      # Assign the new MAX
    fi
    read INPUT
done
if [ $MAX == "?" ]                                          # IF no integer is given
then
    echo "No value has been entered." && exit 1             # Print the error, exit error
fi

echo "Maximum: $MAX"                                        # Print the MAX