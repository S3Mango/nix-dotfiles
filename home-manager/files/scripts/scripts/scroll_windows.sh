#!/usr/bin/env bash

src=~/Scripts

# Get the monitor of the active window
MONITOR=$(hyprctl activewindow -j | jq '.monitor')
echo "MONITOR: $MONITOR"

# Get the address of the active window
ADDRESS=$(hyprctl activewindow -j | jq '.address')
echo "ADDRESS: $ADDRESS"

if [[ -z $2 ]]; then

    echo "NO PROGRAM SPECIFIED"

    LIMITED_ADDRESSES=$(cat $src/addresses.txt | awk -v monitor="$MONITOR " 'index($0,monitor)' | awk '{print NR,$2,$3}')
    printf "LIMITED_ADDRESSES: \n%s\n" "$LIMITED_ADDRESSES"

    LINE_INDEX=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print NR,$2}' | awk -v address="$ADDRESS" 'index($0,address)' | awk '{print $1}')
    echo "INITIAL LINE_INDEX: $LINE_INDEX"

    LINE_INDEX=$(($LINE_INDEX + $1))
    echo "NEW LINE_INDEX: $LINE_INDEX"

    NEW_LINE=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print $1,$2}' | awk -v line_index="$LINE_INDEX " 'index($0,line_index)')
    echo "NEW_LINE: $NEW_LINE"

    if [[ -z $NEW_LINE ]]; then

        echo "NEW_LINE OUT OF BOUNDS, CORRECTING..."
        if [[ $LINE_INDEX = 0 ]]; then
            echo "LINE_INDEX = 0"
            NEXT_ADDRESS=$(printf "%s\n" "$LIMITED_ADDRESSES" | tail -n 1 | awk '{print $2}' )
        else
            echo "LINE_INDEX != 0"
            NEXT_ADDRESS=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print NR,$2}' | awk -v line_index="1 " 'index($0,line_index)' | awk '{print $2}')
        fi

        echo "NEXT_ADDRESS: $NEXT_ADDRESS"

        # Execute the hyprctl command
        eval hyprctl dispatch focuswindow address:$NEXT_ADDRESS

    else

        echo "NEW_LINE IN BOUNDS"

        NEXT_ADDRESS=$(printf "%s" "$NEW_LINE" | awk '{print $2}')
        echo "NEXT_ADDRESS: $NEXT_ADDRESS"

        # Execute the hyprctl command
        eval hyprctl dispatch focuswindow address:$NEXT_ADDRESS

    fi

else

    echo "PROGRAM SPECIFIED"

    PRE_PROCESSING=$(cat $src/addresses.txt | awk -v monitor="$MONITOR " 'index($0,monitor)' | awk '{print NR,$2,$3}')

    CLASS=$2
    echo "CLASS: $CLASS"

    LIMITED_ADDRESSES=$(printf "%s" "$PRE_PROCESSING" | awk -v class="$CLASS" 'index($0,class)' | awk '{print NR,$2}')
    printf "LIMITED_ADDRESSES:\n %s\n" "$LIMITED_ADDRESSES"

    LINE_INDEX=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print NR,$2}' | awk -v address="$ADDRESS" 'index($0,address)' | awk '{print $1}')
    echo "INITIAL LINE_INDEX: $LINE_INDEX"

    LINE_INDEX=$(($LINE_INDEX + $1))
    echo "NEW LINE_INDEX: $LINE_INDEX"

    NEW_LINE=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print $1,$2}' | awk -v line_index="$LINE_INDEX " 'index($0,line_index)')
    echo "NEW_LINE: $NEW_LINE"
    
    if [[ -z $NEW_LINE ]]; then

        echo "NEW_LINE OUT OF BOUNDS, CORRECTING..."
        if [[ $LINE_INDEX = 0 ]]; then
            echo "LINE_INDEX = 0"
            NEXT_ADDRESS=$(printf "%s\n" "$LIMITED_ADDRESSES" | tail -n 1 | awk '{print $2}' )
        else
            echo "LINE_INDEX != 0"
            NEXT_ADDRESS=$(printf "%s" "$LIMITED_ADDRESSES" | awk '{print NR,$2}' | awk -v line_index="1 " 'index($0,line_index)' | awk '{print $2}')
        fi

        echo "NEXT_ADDRESS: $NEXT_ADDRESS"

        # Execute the hyprctl command
        eval hyprctl dispatch focuswindow address:$NEXT_ADDRESS

    else

        echo "NEW_LINE IN BOUNDS"

        NEXT_ADDRESS=$(echo $NEW_LINE | awk '{print $2}')
        echo "NEXT_ADDRESS: $NEXT_ADDRESS"

        # Execute the hyprctl command
        eval hyprctl dispatch focuswindow address:$NEXT_ADDRESS

    fi
fi
