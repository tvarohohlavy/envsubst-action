#!/bin/sh
set -e

# Replace environmental variables in multiple files in place. Line per filename.
echo "$INPUT_FILES" | while IFS= read line ; do sh -c "cat $line | envsubst | sponge $line"; done
