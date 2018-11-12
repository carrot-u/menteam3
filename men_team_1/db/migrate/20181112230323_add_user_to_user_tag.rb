class AddUserToUserTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tags, :user, foreign_key: true
  end
end
