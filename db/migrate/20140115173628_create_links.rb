class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, :null => false
      t.string :description
      t.integer :user_id, :null => false
      t.integer :subreddit_id, :null => false
      
      t.timestamps
    end
  end
end
