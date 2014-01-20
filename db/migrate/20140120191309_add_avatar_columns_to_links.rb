class AddAvatarColumnsToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :avatar
    end
  end
  
  def self.down
    drop_attached_file :links, :avatar
  end
end
