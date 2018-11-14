class AddPairingUserToPost < ActiveRecord::Migration[5.2]
  def up
    add_reference :posts, :pairing, foreign_key: true  
    add_reference :posts, :user, foreign_key: true  
  end

  def down
    remove_column :posts, :pairing
    remove_column :posts, :user
  end

end
