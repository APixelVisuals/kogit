function GET_FORMATTERS() {

    # No color
    NC='\033[0m'

    # Color
    case $PRIMARY_LANGUAGE in

        # Red
        "HTML") COLOR='\033[0;31m';;

        # Yellow
        "Java") COLOR='\033[0;33m';;

        # Blue
        "CSS" | "TypeScript" | "Python" | "C++") COLOR='\033[0;34m';;

        # Magenta
        "C#" | "TypeScript") COLOR='\033[0;35m';;

        # Light Gray
        "C") COLOR='\033[0;37m';;

        # Bright yellow
        "JavaScript") COLOR='\033[0;93m';;

        # Other (bright yellow)
        *) COLOR='\033[0;93m';;

    esac
}