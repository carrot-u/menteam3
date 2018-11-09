class AddUserToUsertag < ActiveRecord::Migration[5.2]
  def change
    add_reference :usertags, :user_id, foreign_key: true
  end
end
