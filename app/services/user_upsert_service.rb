# frozen_string_literal: true

class UserUpsertService
  def initialize; end

  def call(params)
    chat_id = params['from']['id']
    user_params = {
      first_name: params['from']['first_name'],
      last_name: params['from']['last_name'],
      username: params['from']['username'],
      text: params['text'],
      language: params['from']['language_code']
    }
    user = User.find_by(chat_id: chat_id)
    if user
      user.update!(user_params)
    else
      User.create!(user_params.merge(chat_id: chat_id))
    end
  end
end
