function PRINT_STATS() {

    # Format stats
    STATS="Stars: $STARS     Watchers: $WATCHERS     Forks: $FORKS"

    # Get spaces
    SPACES=""
    for i in $(seq 1 $(( ($(tput cols) / 2) - (${#STATS} / 2) ))); do SPACES="$SPACES "; done

    # Print
    echo; echo
    echo -e "$SPACES${COLOR}Stars:${NC} $STARS     ${COLOR}Watchers:${NC} $WATCHERS     ${COLOR}Forks:${NC} $FORKS"
}