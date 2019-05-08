#!/bin/bash

# Make config file
if [ ! -f ~/.config/kogit/config.json ]; then

    mkdir -p ~/.config/kogit/
    echo "{}" > ~/.config/kogit/config.json

fi

# Read config file
CONFIG=$(cat ~/.config/kogit/config.json)
ACCESS_TOKEN=$(echo "$CONFIG" | jq -r ".accessToken")

# Set token
source ./modules/setToken.sh
if [ "$1" == "-t" ] || [ "$1" == "--token" ]; then SET_TOKEN $2; fi

# No access token
if [ "$ACCESS_TOKEN" == "null" ]; then

    echo "You don't have a GitHub access token set. You can set one by using \`kogit -t ACCESS_TOKEN\`"
    exit

fi

# Fetch data
source ./modules/fetchData.sh
FETCH_DATA $1

# Clear screen
clear

# Get formatters
source ./modules/getFormatters.sh
GET_FORMATTERS

# Title
source ./modules/printers/title.sh
PRINT_TITLE

# Description
source ./modules/printers/description.sh
PRINT_DESCRIPTION

# Website
source ./modules/printers/website.sh
PRINT_WEBSITE

# Stats
source ./modules/printers/stats.sh
PRINT_STATS

# Details
source ./modules/printers/details.sh
PRINT_DETAILS

# Primary language
source ./modules/printers/primaryLanguage.sh
PRINT_PRIMARY_LANGUAGE