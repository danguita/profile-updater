# profile-updater

Update your profile securely in multiple services at a time. For now,
there're Twitter and GitHub integrations available.

## Requirements

- [Docker](https://www.docker.com/).
- Valid OAuth credentials for each service.

## Configuration

Take the `.env.example` file as a reference for setting the
required environmental variables:

```shell
$ cp .env.example .env
```

```
# Twitter API OAuth credentials
TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
TWITTER_ACCESS_TOKEN
TWITTER_ACCESS_TOKEN_SECRET

# GitHub API OAuth credentials
GITHUB_ACCESS_TOKEN
```

## Usage

```shell
$ BIO="Your bio" make set_profile         # Set your bio in all integrated services
$ BIO="Your bio" make set_twitter_profile # Set your bio in Twitter
$ BIO="Your bio" make set_github_profile  # Set your bio in GitHub
```

- Feel free to use emoji in your bio :heart:.
- No requests will be performed unless you specify a valid content for
    it.

## License

MIT
