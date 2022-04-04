#!/bin/sh
set -e

# Replace environmental variables in multiple files in place. Line per filename.
echo "$INPUT_FILES" | while IFS= read line ; do envsubst < $line | sponge "$line"; done
