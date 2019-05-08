function GET_FORMATTERS() {

    # No color
    NC='\033[0m'

    # Color
    case $PRIMARY_LANGUAGE in

        # Red
        "HTML" | "Rust" | "Ruby") COLOR='\033[0;31m';;

        # Yellow
        "Java" | "Swift") COLOR='\033[0;33m';;

        # Blue
        "CSS" | "TypeScript" | "Python" | "C++" | "PHP" | "JSONiq" | "CoffeeScript" | "Lua" | "Perl" | "R") COLOR='\033[0;34m';;

        # Magenta
        "C#" | "TypeScript") COLOR='\033[0;35m';;

        # Light Gray
        "C" | "Shell" | "PowerShell" | "Markdown") COLOR='\033[0;37m';;

        # Bright yellow
        "JavaScript") COLOR='\033[0;93m';;

        # Bright blue
        "Dockerfile") COLOR='\033[0;94m';;

        # Other (bright yellow)
        *) COLOR='\033[0;93m';;

    esac
}