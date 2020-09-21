class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :chat_id
      t.text :text
      t.string :language

      t.timestamps
    end
    add_index :users, :chat_id, unique: true
    add_index :users, :username, unique: true
  end
end
