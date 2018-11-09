class CreatePairings < ActiveRecord::Migration[5.2]
  def change
    create_table :pairings do |t|
      t.string :status
      t.references :mentor_id, :mentor, index: true, foreign_key: true
      t.references :mentee_id, :mentee, index: true, foreign_key: true
      t.timestamps
    end
  end
end
