# frozen_string_literal: true

class UserService
  attr_reader :user_params, :chat_id

  def initialize(payload)
    @payload = OpenStruct.new(payload)
    user_params = {
      first_name: @payload.from['first_name'],
      last_name: @payload.from['last_name'],
      username: @payload.from['username'],
      text: @payload.text,
      language: @payload.from['language_code']
    }
    @user_params = user_params
    @chat_id = @payload.from['id']
  end

  def create_or_update_user
    user = User.where(chat_id: chat_id)
    if user.exists?
      user.update(user_params)
    else
      User.create(user_params.merge(chat_id: chat_id))
    end
  end
end
