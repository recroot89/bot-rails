require 'telegram/bot/updates_controller/rspec_helpers'

RSpec.describe TelegramWebhooksController, telegram_bot: :rails do
  include_context 'telegram/bot/updates_controller'
  describe '#start!' do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message 'Hello! You can ask me about the weather or where can you watch a movie' }
  end
end
