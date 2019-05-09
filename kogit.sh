#!/bin/bash

# Make config file
if [ ! -f $HOME/.config/kogit/config.json ]; then

    mkdir -p $HOME/.config/kogit/
    echo "{}" > $HOME/.config/kogit/config.json

fi

# Read config file
CONFIG=$(cat $HOME/.config/kogit/config.json)
ACCESS_TOKEN=$(echo "$CONFIG" | jq -r ".accessToken")

# Set token
source "$(dirname "$0")/kogit-modules/setToken.sh"
if [ "$1" == "-t" ] || [ "$1" == "--token" ]; then SET_TOKEN $2; fi

# No access token
if [ "$ACCESS_TOKEN" == "null" ]; then

    echo "You don't have a GitHub access token set. You can set one by using \`kogit -t ACCESS_TOKEN\`"
    exit

fi

# Fetch data
source "$(dirname "$0")/kogit-modules/fetchData.sh"
FETCH_DATA $1

# Clear screen
clear

# Get formatters
source "$(dirname "$0")/kogit-modules/getFormatters.sh"
GET_FORMATTERS

# Title
source "$(dirname "$0")/kogit-modules/printers/title.sh"
PRINT_TITLE

# Description
source "$(dirname "$0")/kogit-modules/printers/description.sh"
PRINT_DESCRIPTION

# Website
source "$(dirname "$0")/kogit-modules/printers/website.sh"
PRINT_WEBSITE

# Stats
source "$(dirname "$0")/kogit-modules/printers/stats.sh"
PRINT_STATS

# Details
source "$(dirname "$0")/kogit-modules/printers/details.sh"
PRINT_DETAILS

# Primary language
source "$(dirname "$0")/kogit-modules/printers/primaryLanguage.sh"
PRINT_PRIMARY_LANGUAGE