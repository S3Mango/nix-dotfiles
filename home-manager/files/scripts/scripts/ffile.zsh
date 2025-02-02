#!/usr/bin/env zsh

FILE_HISTORY="$HOME/.file_history"
touch "$FILE_HISTORY"

# Function to track and access files
f() {
  local current_time=$(date +%s)

  if [[ -z "$1" ]]; then
    # Rank files based on frequency and recency
    local ranked_files=$(awk -F '\t' -v current_time="$current_time" '
    {
      freq = $1;
      last_access = $2;
      filepath = $3;
      time_since_last_access = current_time - last_access;
      score = freq / (time_since_last_access + 1);
      print score "\t" filepath;
    }
    ' "$FILE_HISTORY" | sort -nr | awk -F '\t' '{print $2}')

    # Use fzf to select from ranked files
    local selected_file=$(echo "$ranked_files" | fzf --preview="cat {}")

    if [[ -n "$selected_file" ]]; then
      open_file "$selected_file" "OPEN"
    fi
  else
    local search_term="$1"
    local fuzzy_find=false
    if [[ "$2" == "f" ]]; then
      fuzzy_find=true
    fi

    # Search for files matching the given argument
    local ranked_files=$(awk -F '\t' -v current_time="$current_time" -v search_term="$search_term" '
    {
      freq = $1;
      last_access = $2;
      filepath = $3;
      time_since_last_access = current_time - last_access;
      score = freq / (time_since_last_access + 1);
      filename = gensub(".*/", "", "g", filepath);

      if (tolower(filename) ~ tolower(search_term)) {
        print score "\t" filepath;
      }
    }
    ' "$FILE_HISTORY" | sort -nr | awk -F '\t' '{print $2}')

    if [[ -n "$ranked_files" ]]; then
      if [[ "$fuzzy_find" == true ]]; then
        local selected_file=$(echo "$ranked_files" | fzf --preview="cat {}")
        if [[ -n "$selected_file" ]]; then
          open_file "$selected_file" "OPEN"
        fi
      else
        local best_match=$(echo "$ranked_files" | head -n 1)
        open_file "$best_match" "OPEN"
      fi
    fi
  fi
}

# Helper function to open a file and log usage
open_file() {
  local file_path="$1"
  local method="$2" # Either "nvim" or "xdg-open"
  local current_time=$(date +%s)

  # Ensure absolute path
  file_path=$(realpath "$file_path")

  # Determine stored method
  local stored_method=$(awk -F '\t' -v file="$file_path" '
    $3 == file {print $4}
  ' "$FILE_HISTORY")

  # Use stored method if available, otherwise default to the provided one
  if [[ -z "$stored_method" ]]; then
    stored_method="$method"
  fi

  # Update .file_history
  if grep -qF "$file_path" "$FILE_HISTORY"; then
    awk -F '\t' -v OFS='\t' -v file="$file_path" -v time="$current_time" -v method="$method" '
    {
      if ($3 == file) {
        $1 += 1; # Increment frequency
        $2 = time; # Update last access time
        $4 = method; # Update opening method
      }
      print $0;
    }
    ' "$FILE_HISTORY" > "$FILE_HISTORY.tmp" && mv "$FILE_HISTORY.tmp" "$FILE_HISTORY"
  else
    echo -e "1\t$current_time\t$file_path\t$method" >> "$FILE_HISTORY"
  fi

  # Open the file with the appropriate tool
  if [[ "$stored_method" == "xdg-open" ]]; then
    xdg-open "$file_path" &
  else
    nvim "$file_path"
  fi
}

# Fuzzy finder wrapper
ff() {
  f "$1" "f"
}

if [[ "$2" == "ADD" ]]; then
  open_file "$1" "$3"
else
  ff
fi

