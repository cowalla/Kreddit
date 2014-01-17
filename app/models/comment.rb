class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :link_id, :parent_comment_id
  
  belongs_to :user
  belongs_to :link
  has_many :votes
  
  belongs_to :parent_comment,
  :class_name => "Comment",
  :foreign_key => :parent_comment_id,
  :primary_key => :id
  
  has_many :comments,
  :class_name => "Comment",
  :foreign_key => :parent_comment_id,
  :primary_key => :id
  
end
