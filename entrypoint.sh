#!/bin/sh
set -e


if [ -n "$INPUT_VARIABLES" ]; then
  # Create string limiting variables replaced
  variables=$(echo "$INPUT_VARIABLES" | tr '\n' ',' | sed -E 's/,+$//g')
  echo "$INPUT_FILES" | while IFS= read line ; do sh -c "cat $line | envsubst '$variables' | sponge $line"; done

else
  # Replace environmental variables in multiple files in place. Line per filename.
  echo "$INPUT_FILES" | while IFS= read line ; do sh -c "cat $line | envsubst | sponge $line"; done
fi
