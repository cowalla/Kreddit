class Vote < ActiveRecord::Base
  attr_accessible :value, :user_id, :link_id, :comment_id
  
  belongs_to :user
  belongs_to :link
  belongs_to :comment
  
end
