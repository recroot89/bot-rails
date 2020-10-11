[![github action status](https://github.com/recroot89/bot-rails/workflows/On%20Push/badge.svg)](https://actions-badge.atrox.dev/recroot89/bot-rails/goto)

# Bot Rails

Requirements:

- docker
- docker-compose
- ngrok (for Webhook mode)

1. Clone the repository and install the app:

```
make compose-setup
```

2. Run the app:

```
make start
```

3. Run tests:

```
make test
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

   2.1. change bot settings for test environment: `bin/rails credentials:edit --environment test`
   example:

```
{
  telegram:
    bot: 'test'
}
```

3. enter the new token and save file
