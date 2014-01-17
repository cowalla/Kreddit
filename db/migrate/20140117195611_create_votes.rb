class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, :null => false
      t.integer :user_id, :null => false
      t.integer :link_id
      t.integer :comment_id
      
      t.timestamps
    end
    add_index :votes, :user_id
  end
end
