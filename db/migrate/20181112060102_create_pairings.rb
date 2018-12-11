class CreatePairings < ActiveRecord::Migration[5.2]
  def change
    create_table :pairings do |t|
      t.string :status
      # add_reference :pairings, :mentor, index: true, foreign_key: true
      # add_reference :pairings, :mentee, index: true, foreign_key: true
      # t.references :mentor, index: true#, foreign_key: {to_table: :users}
      # t.references :mentee, index: true#, foreign_key: {to_table: :users}
      t.timestamps
    end

  end
end
