#!/bin/bash

# Make config directory
if [ ! -d ~/.config/kogit/ ]; then

    mkdir -p ~/.config/kogit/

fi

# Set token
if [ "$1" == "-t" ] || [ "$1" == "--token" ]; then

    echo "$2" > ~/.config/kogit/access-token
    echo "Your GitHub access token has been set"
    exit

fi

# No access token
if [ ! -f ~/.config/kogit/access-token ]; then

    echo "You don't have a GitHub access token set. You can set one by using \`kogit -t ACCESS_TOKEN\`"
    exit

fi

# Clear screen
clear

# Read config files
ACCESS_TOKEN=$(cat ~/.config/kogit/access-token)

# Fetch data
source ./modules/fetchData.sh
FETCH_DATA $1

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