class AddTopicToUsertag < ActiveRecord::Migration[5.2]
  def change
    add_reference :usertags, :topic_id, foreign_key: true
  end
end
