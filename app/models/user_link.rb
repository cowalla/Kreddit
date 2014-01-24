class UserLink < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :avatar
  validates_uniqueness_of :user_id, :scope => [:link_id]
  
  belongs_to :user
  belongs_to :link
  
end
