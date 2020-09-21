class TelegramWebhooksController < Telegram::Bot::UpdatesController
  before_action :define_user

  def start!(*)
    respond_with :message, text: t('.content')
  end

  def message(message)
    respond_with :message, text: t('.content', text: message['text'])
  end

  def action_missing(_action, *_args)
    return unless action_type == :command
    respond_with :message,
                 text: t('telegram_webhooks.action_missing.command',
                         command: action_options[:command])
  end

  def define_user
    UserService.new(payload).create_or_update_user
  end

end
