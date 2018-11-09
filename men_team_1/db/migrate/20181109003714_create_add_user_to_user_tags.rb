class CreateAddUserToUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :add_user_to_user_tags do |t|
      t.references :userid, foreign_key: true

      t.timestamps
    end
  end
end
