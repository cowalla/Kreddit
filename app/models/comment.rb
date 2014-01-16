class Comment < ActiveRecord::Base
  attr_accessible :user_id, :body, :link_id
  
  belongs_to :user
  belongs_to :link
end
