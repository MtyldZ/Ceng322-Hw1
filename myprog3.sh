#!/bin/bash

if [ ! -z $1 ]                                                    # Check is parameter entered
then
  [ ! -d $1 ] && echo "Directory $1 DOES NOT exists." && exit 1   # Check if directory is exists.
  cd $1                                                           # if exists change directory
fi

FILE_COUNT=0                                                      # Counter to count empty files
for FILE in *                                                     # List every file
do
  if [ ! -s "${FILE}" ]                                           # Check if FILE's size greater than zero
  then
    ((FILE_COUNT++))                                              # Increment the FILE_COUNT
    echo "${FILE_COUNT}. ${FILE}"                                 # Print the name of the file
    rm "$FILE"
  fi
done

dir=$(pwd)                                                                  # Get Absolute path
echo "$FILE_COUNT zero-length files are removed from the directory: $dir"   # Print the results

