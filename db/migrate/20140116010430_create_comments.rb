class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :link_id, :null => false
      t.integer :parent_comment_id
      
      t.timestamps
    end
  end
end
