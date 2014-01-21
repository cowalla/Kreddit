class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :title, :null => false
      t.integer :user_id, :null => false
      t.text :description
      
      t.timestamps
    end
  end
end
