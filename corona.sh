#!/bin/bash

# TODO: Redirect errors to stderr

# Functions
# 
function showHelp() {
  echo
  echo "Usage: $(basename $0) [-h] [FILTERS] [COMMAND] [LOG [LOG 2 [...]]"

  echo
  echo "FILTERS can be one of following:"
  echo "  -a DATETIME - Shows records AFTER specified date in YYYY-MM-DD format"
  echo "  -a DATETIME - Shows records BEFORE specified date in YYYY-MM-DD format"
  echo "  -g GENDER - Shows records based on gender (Can be one of: M(male) or Z(female))"
  echo "  -s [WIDTH] - Shows records as histograms for following commands: gender, age, daily, monthly, yearly, countries, districts, regions. Width can only be an unsigned integer"

  exit 0
}

# Variables
OPTIND=1
NUMBER_REGEX="^[0-9]+$"

# Exit if no input is specified
if [[ ${#} -eq 0 ]]; then
  showHelp
fi

# Handles filters and help command
while getopts ":ha:b:g:s:" opt; do
  case "$opt" in
    h)
      showHelp
      ;;
    a)
      echo "After $OPTARG"
      ;;
    b)
      echo "Before $OPTARG"
      ;;
    g)
      echo "Gender is $OPTARG"
      ;;
    s)
      # TODO: Check if the command argument is not there, if yes, proceed
      if ! [[ $OPTARG =~ $NUMBER_REGEX ]] ; then
        echo "WIDTH can be only unsigned number"
        showHelp
      fi

      echo "Supposed to be a histogram with width $OPTARG"
      ;;
    \?)
      showHelp
      ;;
  esac
done

# Check commands
case "${@:$OPTIND:1}" in
  infected)
    echo "You are infected cunt"
    ;;
  merge)
    echo "Merge"
    ;;
  gender)
    echo "Gender"
    ;;
  age)
    echo "Age"
    ;;
  daily)
    echo "Daily"
    ;;
  monthly)
    echo "Monthly"
    ;;
  yearly)
    echo "Yearly"
    ;;
  countries)
    echo "Countries"
    ;;
  districts)
    echo "Districts"
    ;;
  regions)
    echo "regions"
    ;;
  *)
    echo "Not a valid command"
    ;;
esac
  
if ! [[ -f ${@:$OPTIND+1:1} ]]
then
  echo "Not a file"
else
  echo "${@:$OPTIND+1:1} is a file"
fi
    
