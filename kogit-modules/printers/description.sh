function PRINT_DESCRIPTION() {

    # No description
    if [ "$DESCRIPTION" == "null" ]; then

        DESCRIPTION="No description"
        DESCRIPTION_FORMATTING_BEGINNING="\e[3m"
        DESCRIPTION_FORMATTING_END="\e[0m"

    fi

    # Get lines count
    DESCRIPTION_LINES_COUNT=$(( ${#DESCRIPTION} / $(tput cols) ))
    DESCRIPTION_LINES_COUNT=${DESCRIPTION_LINES_COUNT%.*}

    # Get last line
    if (( ${#DESCRIPTION} >= $(tput cols) )); then DESCRIPTION_FIRST_LINES=$(echo $DESCRIPTION | cut -c -$(( $DESCRIPTION_LINES_COUNT * $(tput cols) ))); fi
    DESCRIPTION_LAST_LINE=$(echo $DESCRIPTION | cut -c $(( ($DESCRIPTION_LINES_COUNT * $(tput cols)) + 1 ))-)

    # Get spaces
    SPACES_LENGTH=$(( ($(tput cols) / 2) - (${#DESCRIPTION_LAST_LINE} / 2) ))
    SPACES=""
    for i in $(seq 1 $SPACES_LENGTH); do SPACES="$SPACES "; done

    # Print
    echo
    if (( ${#DESCRIPTION} >= $(tput cols) )); then echo "$DESCRIPTION_FIRST_LINES"; fi
    echo -e "$SPACES${DESCRIPTION_FORMATTING_BEGINNING}$DESCRIPTION_LAST_LINE${DESCRIPTION_FORMATTING_END}"
}