class CreateAddTopicToUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :add_topic_to_user_tags do |t|
      t.references :topicid, foreign_key: true

      t.timestamps
    end
  end
end
