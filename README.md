<h1 align="center">Kogit</h1>

Kogit is a small CLI application written fully in Bash. Its goal is to get information about a given GitHub repository and display its details in a pleasing manner. Kogit does this by formatting the output to look more appealing, such as using color and dynamic spacing.

<h1 align="center">Features</h1>

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

<h1 align="center">Installation</h1>

1. Download the [latest release](https://github.com/APixelVisuals/kogit/releases/latest)
2. Extract the tarball
3. Run `make` in the extracted directory

<h1 align="center">Usage</h1>

### Set a GitHub access token
Run the Kogit command with the `-t` or `--token` flag:
```
$ kogit -t ACCESS_TOKEN
```

### Fetch repo details
```
$ kogit APixelVisuals/kogit
```

---

<h2 align="center">Trello</h2>
<p align="center">You can view plans for the future of Kogit over on <a href="https://trello.com/b/F1qB0bdK/kogit">the Trello</a></p>

<h2 align="center">Inspiration</h2>
<p align="center">Kogit is inspired by <a href="https://github.com/dylanaraps/neofetch">Neofetch</a> ❤</p>

<h2 align="center">License</h2>
<p align="center">MIT</p>