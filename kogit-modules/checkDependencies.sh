function CHECK_DEPENDENCIES() {

    # Get OS
    source "/etc/os-release"
    OS=$NAME

    # Get package management functions
    case $OS in

        *"Ubuntu"* | *"Linux Mint"* | *"Debian"* | *"elementary"* | *"Zorin OS"*)

            IS_INSTALLED() {
                if [ "$(dpkg-query -Wf '${Status}' $1 2>/dev/null)" == "install ok installed" ]; then INSTALLED=1; else INSTALLED=0; fi
            }

            INSTALL() {
                sudo apt-get install $1
            }

        ;;

        *"Fedora"*)

            IS_INSTALLED() {
                if [ "$(rpm -qa $1)" == "" ]; then INSTALLED=0; else INSTALLED=1; fi
            }

            INSTALL() {
                sudo yum install $1
            }

        ;;

        *"openSUSE"*)

            IS_INSTALLED() {
                if [ "$(rpm -qa $1)" == "" ]; then INSTALLED=0; else INSTALLED=1; fi
            }

            INSTALL() {
                sudo zypper install $1
            }
        
        ;;

        *)

            if [ -f $HOME/.config/kogit/dependenciesChecked ]; then return; else

                echo "Automatic dependency installation isn't supported by Kogit on your OS. Please make sure the following dependencies are installed (they might already be), and then rerun your command:"
                echo

                echo "curl"
                echo "jq"

                echo
                echo "Additionally, you can open an issue at https://github.com/APixelVisuals/kogit and request support for automatic dependency installation for your OS."

                touch $HOME/.config/kogit/dependenciesChecked

                exit

            fi

        ;;

    esac

    # Get unmet dependencies
    UNMET_DEPENDENCIES=()

    IS_INSTALLED "curl"
    if [ $INSTALLED == 0 ]; then UNMET_DEPENDENCIES+=("curl"); fi

    IS_INSTALLED "jq"
    if [ $INSTALLED == 0 ]; then UNMET_DEPENDENCIES+=("jq"); fi

    # Install unmet dependencies
    if [ "$1" == 1 ]; then

        if (( ${#UNMET_DEPENDENCIES[@]} > 0 )); then

            for DEPENDENCY in ${UNMET_DEPENDENCIES[@]}; do
                echo "Installing $DEPENDENCY..."
                INSTALL $DEPENDENCY
            done

        else
            echo "There are no unmet dependencies"
        fi

        exit

    fi
}