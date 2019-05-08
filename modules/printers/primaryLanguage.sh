function PRINT_PRIMARY_LANGUAGE() {

    # No primary language
    if [ "$PRIMARY_LANGUAGE" == "null" ]; then

        PRIMARY_LANGUAGE="No primary language"
        PRIMARY_LANGUAGE_FORMATTING_BEGINNING="\e[3m"
        PRIMARY_LANGUAGE_FORMATTING_END="\e[0m"

    fi

    # Spaces
    SPACES_LENGTH=$(( ($(tput cols) / 2) - (${#PRIMARY_LANGUAGE} / 2) ))
    SPACES=""
    for i in $(seq 1 $SPACES_LENGTH); do SPACES="$SPACES "; done

    # Print
    echo
    echo -e "$SPACES${COLOR}${PRIMARY_LANGUAGE_FORMATTING_BEGINNING}$PRIMARY_LANGUAGE${PRIMARY_LANGUAGE_FORMATTING_END}${NC}"
}