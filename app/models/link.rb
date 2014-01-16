class Link < ActiveRecord::Base
  attr_accessible :url, :description, :user_id, :subreddit_id
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  belongs_to :subreddit
  
end
