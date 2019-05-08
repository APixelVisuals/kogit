function FETCH_DATA() {

    # Make request
    RESULT=$(curl -sH "Authorization: token $ACCESS_TOKEN" https://api.github.com/repos/$1)

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