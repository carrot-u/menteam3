class AddTopicToUserTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tags, :topic, foreign_key: true
  end
end
