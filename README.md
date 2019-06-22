<p align="center"><img src="./assets/title.png" alt="Title" height="100px" /></p>

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

### Fetch repo details
```
$ kogit APixelVisuals/kogit
```

### Set a GitHub access token
Setting an access token is optional, but gives you a much higher rate limit. Here's how you can generate and set one:

1. Go to your [GitHub Settings](https://github.com/settings/profile)
2. Click on [Developer Settings](https://github.com/settings/apps)
3. Click on [Personal Access Tokens](https://github.com/settings/tokens)
4. Click `Generate New Token` (GitHub might prompt you to enter your password)
5. Enable the `repo` scope
6. Click `Generate Token` at the bottom
7. Copy your new access token and run the Kogit command with the `-t` or `--token` flag:
```
$ kogit -t ACCESS_TOKEN
```

---

<h2 align="center">Trello</h2>
<p align="center">You can view plans for the future of Kogit over on <a href="https://trello.com/b/F1qB0bdK/kogit">the Trello</a></p>

<h2 align="center">Inspiration</h2>
<p align="center">Kogit is inspired by <a href="https://github.com/dylanaraps/neofetch">Neofetch</a> ❤</p>

<h2 align="center">License</h2>
<p align="center"><a href="./LICENSE">MIT</a></p>