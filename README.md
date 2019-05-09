# Kogit
Kogit is a small CLI application written fully in Bash. Its goal is to get information about a given GitHub repository and display its details in a pleasing manner. Kogit does this by formatting the output to look more appealing, such as using color and dynamic spacing.

# Features
- Display details about a given GitHub repository
  - Full name (owner's name + repo name)
  - Description
  - Website
  - Star count
  - Watcher count
  - Fork count
  - Privacy
  - Creation date
  - Primary language
- Beautiful formatting
- Support for a GitHub access token to enable viewing your private repos and a better ratelimit

# Installation
1. Download the [latest release](xxx)
2. Extract the tarball
3. Run `make` in the extracted directory

# Usage
### Set a GitHub access token
Run the Kogit command with the `-t` or `--token` flag:
```
$ kogit -t MY_GITHUB_ACCESS_TOKEN
```

### Fetch repo details
```
$ kogit APixelVisuals/kogit
```

# Trello
You can view plans for the future of Kogit over on [the Trello](https://trello.com/b/F1qB0bdK/kogit)

# Inspiration
Kogit is inspired by [Neofetch](https://github.com/dylanaraps/neofetch) :heart:

# License
MIT