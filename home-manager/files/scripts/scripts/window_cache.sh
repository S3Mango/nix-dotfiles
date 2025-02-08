#!/usr/bin/env bash
src=$HOME/Scripts/

echo "" > $src/addresses.txt

UpdateCache () {

    # Get the monitor of the active window
    MONITOR=$(hyprctl activewindow -j | jq '.monitor')
    echo "MONITOR: $MONITOR"
    
    # Get the address of the active window
    ADDRESS=$(hyprctl activewindow -j | jq '.address')
    echo "ADDRESS: $ADDRESS"
    
    # Get the class of the window
    CLASS=$(hyprctl activewindow -j | jq '.class')
    echo "CLASS: $CLASS"
    
    # Check if ADD or REMOVE was passed as an argument
    if [[ $1 = "ADD" ]]; then
    
        echo "CHOSE ADD"

        # Find the address and monitor registered to the file
        IN_LIST=$(cat $src/addresses.txt | grep " $ADDRESS")
        echo "IN_LIST: $IN_LIST"
    
        MONITOR_CHECK=$(echo $IN_LIST | awk '{print $1}')
        echo "MONITOR_CHECK: $MONITOR_CHECK"

        # Check if the address is in the list
        if [[ -z $IN_LIST ]]; then

            echo "IN_LIST = 0"
            FILE=$(cat $src/addresses.txt)
            if [[ -z $FILE ]]; then

                echo "FILE CONTENTS ARE EMPTY"
                # Add it to the first line
                echo $MONITOR $ADDRESS $CLASS > $src/addresses.txt

            else

                echo "FILE CONTENTS ARE NOT EMPTY"
                # Add it to the end of the file
                echo $MONITOR $ADDRESS $CLASS >> $src/addresses.txt

            fi

        # Check if the monitor registered to the address is correct
        elif [[ $MONITOR != $MONITOR_CHECK ]]; then

            echo "MONITOR != MONITOR_CHECK"
            # Remove the line from the file and then add the updated version to the end
            NEW_FILE=$(awk -v address="$ADDRESS" '!index($0,address)' $src/addresses.txt)
            printf 'NEW_FILE:\n%s\n' "$NEW_FILE"
            printf '%s\n' "$NEW_FILE" > $src/addresses.txt
            echo "REMOVED LINE"

            echo $MONITOR $ADDRESS $CLASS >> $src/addresses.txt
            echo "ADDED NEW LINE TO THE BOTTOM"

        fi
    
    elif [[ $1 = "REMOVE" ]]; then

        echo "CHOSE REMOVE"
        # Remove the line from the file
        ADDRESS_NEW="0x$2"
        echo "ADDRESS_NEW: $ADDRESS_NEW"

        # Remove the line from the file
        NEW_FILE=$(awk -v address="$ADDRESS_NEW" '!index($0,address)' $src/addresses.txt)
        printf 'NEW_FILE:\n%s\n' "$NEW_FILE"
        printf '%s\n' "$NEW_FILE" > $src/addresses.txt
        echo "REMOVED LINE"

    fi

}

# Handle compositor events
handle () {
    case $1 in
        openwindow*)
            echo "--------------------------------"
            echo "HANDLE_PARAMS: $1"
            UpdateCache ADD ;;
        movewindowv2*)
            echo "--------------------------------"
            echo "HANDLE_PARAMS: $1"
            UpdateCache ADD ;;
        closewindow*)
            echo "--------------------------------"
            echo "HANDLE_PARAMS: $1"
            UpdateCache REMOVE ${1:13:12};;
    esac
}

# Connect to socket2
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
