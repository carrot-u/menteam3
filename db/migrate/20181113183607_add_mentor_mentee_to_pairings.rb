class AddMentorMenteeToPairings < ActiveRecord::Migration[5.2]
  def change
    add_reference :pairings, :mentor, index: true, foreign_key: true
    add_reference :pairings, :mentee, index: true, foreign_key: true
  end
end
