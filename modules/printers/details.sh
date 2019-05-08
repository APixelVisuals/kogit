function PRINT_DETAILS() {

    # Format privacy
    if [ $PRIVATE == "true" ]; then PRIVACY="Private"
    else PRIVACY="Public"
    fi

    # Format created on
    CREATED_ON=$(date -d $CREATED_ON "+%A, %B %d, %Y")

    # Format details
    DETAILS="Privacy: $PRIVACY     Created On: $CREATED_ON"

    # Get spaces
    SPACES=""
    for i in $(seq 1 $(( ($(tput cols) / 2) - (${#DETAILS} / 2) ))); do SPACES="$SPACES "; done

    # Print
    echo
    echo -e "$SPACES${COLOR}Privacy:${NC} $PRIVACY     ${COLOR}Created On:${NC} $CREATED_ON"
}