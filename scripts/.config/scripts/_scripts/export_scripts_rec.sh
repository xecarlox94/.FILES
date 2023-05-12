#!/bin/sh


DIRECTORY="$HOME/.config/.FILES/scripts/.config/scripts/_scripts"


DIRECTORIES=$(find $DIRECTORY -type d -printf '%p\n')


for D in $DIRECTORIES
do

  FILE_NAMES=$(echo "$D" | xargs ls -l | awk '{print $9}' | sed -r '/^\s*$/d');

  for F_NAME in $FILE_NAMES
  do
    
    TEMP_FILE_NAME=$(echo "$F_NAME" | cut -f1 -d".");
    ALIAS_NAME="_ex_$TEMP_FILE_NAME";

    FILE_PATH="$D/$F_NAME";

    alias "$ALIAS_NAME"="$FILE_PATH";

    echo "EXPORTING: $FILE_PATH";
    echo "ALIAS NAME: $ALIAS_NAME";


  done;


done;
