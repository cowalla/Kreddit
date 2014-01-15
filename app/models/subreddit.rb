class Subreddit < ActiveRecord::Base
  attr_accessible :title, :user_id
  
  belongs_to :user
  has_many :links
end
