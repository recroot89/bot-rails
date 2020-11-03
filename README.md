[![github action status](https://github.com/recroot89/bot-rails/workflows/On%20Push/badge.svg)](https://actions-badge.atrox.dev/recroot89/bot-rails/goto)

# Bot Rails

Requirements:

- docker
- docker-compose
- ngrok (for Webhook mode)

### Setup

```sh
$ git clone git@github.com:recroot89/bot-rails.git
$ cd bot-rails
$ make compose-setup
# start the app
$ make start
# run tests
$ make test
```

Admin (ActiveAdmin): `http://localhost:3000/admin`

<hr>

## Webhook mode:

1. Run ngrok and update `default_url_options` in development.rb

```
make set-webhook
```

2. Show Webhook info:
   https://api.telegram.org/bot{BOT_TOKEN}/getWebhookInfo

## Poller mode:

1. Delete Webhook
   https://api.telegram.org/bot{BOT_TOKEN}/deleteWebhook
2. `make bash`
3. Run `bin/rake telegram:bot:poller`

<hr>

### Change telegram bot token:

1. `make bash`
2. `bin/rails credentials:edit --environment development`

Example for test environment:

```
{
  telegram:
    bot: test
}
```
