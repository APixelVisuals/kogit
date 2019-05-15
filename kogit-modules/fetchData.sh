function FETCH_DATA() {

    # Make request
    if [ "$ACCESS_TOKEN" == "null" ]; then RESULT=$(curl -s https://api.github.com/repos/$1)
    else RESULT=$(curl -sH "Authorization: token $ACCESS_TOKEN" https://api.github.com/repos/$1); fi
    ERROR=$(echo "$RESULT" | jq -r ".message")

    # Invalid access token
    if [ "$ERROR" == "Bad credentials" ]; then

        echo "Your GitHub access token is invalid. You can set a new one by using \`kogit -t ACCESS_TOKEN\`"
        exit

    fi

    # Invalid repo
    if [ "$ERROR" == "Not Found" ]; then

        echo "That repository doesn't exist or you don't have permission to view it"
        exit

    fi

    # Rate limited
    if [[ "$ERROR" == "API rate limit exceeded"* ]]; then

        if [ "$ACCESS_TOKEN" == "null" ]; then echo "You have hit the rate limit, however, you can set a GitHub access token in order to have a better rate limit by using \`kogit -t ACCESS_TOKEN\`"
        else echo "You have hit the rate limit"; fi
        exit

    fi

    # Define vars
    ID=$(echo "$RESULT" | jq -r ".id")
    FULL_NAME=$(echo "$RESULT" | jq -r ".full_name")
    DESCRIPTION=$(echo "$RESULT" | jq -r ".description")
    WEBSITE=$(echo "$RESULT" | jq -r ".homepage")
    STARS=$(echo "$RESULT" | jq -r ".stargazers_count")
    WATCHERS=$(echo "$RESULT" | jq -r ".subscribers_count")
    FORKS=$(echo "$RESULT" | jq -r ".forks_count")
    PRIMARY_LANGUAGE=$(echo "$RESULT" | jq -r ".language")
    PRIVATE=$(echo "$RESULT" | jq -r ".private")
    CREATED_ON=$(echo "$RESULT" | jq -r ".created_at")
}