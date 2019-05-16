function ERROR() {

    ERROR_TEXT=$1

    # Get lines count
    ERROR_LINES_COUNT=$(( ${#ERROR_TEXT} / $(tput cols) ))
    ERROR_LINES_COUNT=${ERROR_LINES_COUNT%.*}

    # Get last line
    if (( ${#ERROR_TEXT} >= $(tput cols) )); then ERROR_FIRST_LINES=$(echo $ERROR_TEXT | cut -c -$(( $ERROR_LINES_COUNT * $(tput cols) ))); fi
    ERROR_LAST_LINE=$(echo $ERROR_TEXT | cut -c $(( ($ERROR_LINES_COUNT * $(tput cols)) + 1 ))-)

    # Get spaces
    SPACES_LENGTH=$(( ($(tput cols) / 2) - (${#ERROR_LAST_LINE} / 2) ))
    SPACES=""
    for i in $(seq 1 $SPACES_LENGTH); do SPACES="$SPACES "; done

    # Get Formatters
    NC='\033[0m'
    BOLD='\033[1m'
    RED='\033[0;31m'

    # Print
    echo; echo -e "${RED}${BOLD}"
    if (( ${#ERROR_TEXT} >= $(tput cols) )); then echo "$ERROR_FIRST_LINES"; fi
    echo -e "$SPACES$ERROR_LAST_LINE"
    echo; echo -e "${NC}"
}