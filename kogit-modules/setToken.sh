function SET_TOKEN() {

    # Set token
    export ACCESS_TOKEN="$1"
    CONFIG=$(echo "$CONFIG" | jq '.accessToken = env.ACCESS_TOKEN')

    # Save config file
    echo "$CONFIG" > $HOME/.config/kogit/config.json

    # Confirm
    echo "Your GitHub access token has been set"

    # Exit
    exit
}