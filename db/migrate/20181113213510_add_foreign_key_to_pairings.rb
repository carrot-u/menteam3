class AddForeignKeyToPairings < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :pairings, :users, column: :mentee_id, primary_key: :id
    add_foreign_key :pairings, :users, column: :mentor_id, primary_key: :id
  end
end
