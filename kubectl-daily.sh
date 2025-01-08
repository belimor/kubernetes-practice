#!/usr/bin/bash

# File containing the list of strings
STRINGS_FILE="commands.txt"

# File to store the index of the last used string
LAST_INDEX_FILE="last_index.txt"

# Ensure the strings file exists
if [[ ! -f $STRINGS_FILE ]]; then
    echo "Error: $STRINGS_FILE not found. Please create the file with one string per line."
    exit 1
fi

# Read the strings into an array
mapfile -t STRINGS < "$STRINGS_FILE"

# Check if the strings file is empty
if [[ ${#STRINGS[@]} -eq 0 ]]; then
    echo "Error: $STRINGS_FILE is empty. Please add strings to the file."
    exit 1
fi

# Check if last_index is empty
#if [[ ${#LAST_INDEX_FILE[@]} -eq 0 ]]; then
#	echo "0" > "$LAST_INDEX_FILE"
#else
  # Determine the last used index
  if [[ -f $LAST_INDEX_FILE ]]; then
      LAST_INDEX=$(<"$LAST_INDEX_FILE")
  else
      LAST_INDEX=-1
  fi
#fi

# Calculate the next index (wrap around if needed)
NEXT_INDEX=$(( (LAST_INDEX + 1) % ${#STRINGS[@]} ))

# Echo the next string
echo "${STRINGS[$NEXT_INDEX]}"

# Save the current index for the next execution
echo "$NEXT_INDEX" > "$LAST_INDEX_FILE"


