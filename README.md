# Bot Rails

## Install

Requirements:

- docker
- docker-compose
- ngrok (for Webhook mode)

1. Clone the repository, cd to the project's root folder and execute:

```
make compose-setup
```

2. Run:

```
make start_bot
```

Admin (ActiveAdmin): `https://localhost:3000/admin`

<hr>
## Webhook mode:
1. Run ngrok and set Webhook
https://api.telegram.org/bot{BOT_TOKEN}/setWebhook?url=https://7ba680876ff0.ngrok.io/telegram/{BOT_TOKEN2}
BOT_TOKEN2 is the same BOT_TOKEN with replaced colon with underline

2. Show Webhook info:
   https://api.telegram.org/bot{BOT_TOKEN}/getWebhookInfo
   <br>

## Poller mode:

1. Delete Webhook
   https://api.telegram.org/bot{BOT_TOKEN}/deleteWebhook
2. Run bash: `make bash_bot`
3. Run `bin/rake telegram:bot:poller`

<hr>
### Change telegram bot token:
1. `make bash_bot`
2. `bin/rails credentials:edit --environment development`
3. enter the new token and save file
