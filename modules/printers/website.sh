function PRINT_WEBSITE() {

    # No website
    if [ "$WEBSITE" == "" ]; then

        WEBSITE="No website"
        WEBSITE_FORMATTING_BEGINNING="\e[3m"
        WEBSITE_FORMATTING_END="\e[0m"

    fi

    # Get spaces
    SPACES_LENGTH=$(( ($(tput cols) / 2) - (${#WEBSITE} / 2) ))
    SPACES=""
    for i in $(seq 1 $SPACES_LENGTH); do SPACES="$SPACES "; done

    # Print
    echo -e "$SPACES${COLOR}${WEBSITE_FORMATTING_BEGINNING}$WEBSITE${WEBSITE_FORMATTING_END}${NC}"
}