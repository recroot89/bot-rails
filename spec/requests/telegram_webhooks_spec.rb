# frozen_string_literal: true

require 'telegram/bot/updates_controller/rspec_helpers'

RSpec.describe TelegramWebhooksController, telegram_bot: :rails do
  include_context 'telegram/bot/updates_controller'

  describe '#start!' do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message 'Hello! You can ask me about the weather or where can you watch a movie' }
  end

  describe '#message' do
    subject { -> { dispatch_message text } }
    let(:text) { 'some text message' }
    it { should respond_with_message "You wrote: #{text}" }
  end

  describe 'unsupported commands' do
    subject { -> { dispatch_command :bad_command } }
    it { should respond_with_message 'Can not perform bad_command' }
  end
end
