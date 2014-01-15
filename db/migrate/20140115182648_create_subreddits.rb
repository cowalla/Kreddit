class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :title, :null => false
      t.string :user_id, :null => false
      
      t.timestamps
    end
  end
end
