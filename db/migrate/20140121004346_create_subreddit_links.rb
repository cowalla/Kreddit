class CreateSubredditLinks < ActiveRecord::Migration
  def change
    create_table :subreddit_links do |t|
      t.integer :subreddit_id, :null => false
      t.integer :link_id, :null => false
      
      t.timestamps
    end
  end
end
