function PRINT_TITLE() {

    # Format title
    TITLE="$FULL_NAME ($ID)"

    # Get border
    BORDER_LENGTH=$((${#TITLE} + 4))
    BORDER=""
    for i in $(seq 1 $BORDER_LENGTH); do BORDER="$BORDER="; done

    # Get spaces
    SPACES_LENGTH=$(( ($(tput cols) / 2) - ($BORDER_LENGTH / 2) ))
    SPACES=""
    for i in $(seq 1 $SPACES_LENGTH); do SPACES="$SPACES "; done

    # Print
    echo "$SPACES$BORDER"
    echo -e "$SPACES  ${COLOR}$TITLE${NC}"
    echo "$SPACES$BORDER"
}