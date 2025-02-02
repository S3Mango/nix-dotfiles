##!/bin/bash

# Check if the directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory/"
    exit 1
fi

# Get the directory path
dir="$1"

# Ensure the provided path is a directory
if [ ! -d "$dir" ]; then
    echo "Error: '$dir' is not a directory."
    exit 1
fi

# Get the parent directory and the base name of the directory
parent_dir=$(dirname "$dir")
base_name=$(basename "$dir")

# Construct the output archive path with the .7z extension
output_file="$parent_dir/$base_name.7z"

# Create the 7zip archive
7z a "$output_file" "$dir"

# Check if the archiving succeeded
if [ $? -eq 0 ]; then
    echo "Archive created: $output_file"
else
    echo "Error creating archive."
    exit 1
fi

