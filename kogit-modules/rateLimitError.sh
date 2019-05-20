function RATE_LIMIT_ERROR() {

    # Get time left
    if [ "$ACCESS_TOKEN" == "null" ]; then TIME_LEFT=$(curl -s https://api.github.com/rate_limit)
    else TIME_LEFT=$(curl -sH "Authorization: token $ACCESS_TOKEN" https://api.github.com/rate_limit); fi

    # Parse time left
    TIME_LEFT=$(( $(echo "$TIME_LEFT" | jq -r ".rate.reset") - $(date +%s) ))
    MINUTES_LEFT=$(( $TIME_LEFT / 60 ))
    SECONDS_LEFT=$(( $TIME_LEFT % 60 ))

    # Send error
    if [ "$ACCESS_TOKEN" == "null" ]; then ERROR "You have hit the rate limit, however, you can set a GitHub access token in order to have a better rate limit by using \`kogit -t ACCESS_TOKEN\`. Otherwise, please wait another $MINUTES_LEFT minutes and $SECONDS_LEFT seconds"
    else ERROR "You have hit the rate limit. Please wait another $MINUTES_LEFT minutes and $SECONDS_LEFT seconds"; fi
    exit
}