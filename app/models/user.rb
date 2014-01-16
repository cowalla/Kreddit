class User < ActiveRecord::Base
  attr_accessible :username, :password
  
  has_many :subreddits
  has_many :links
  has_many :comments
  # has_many :subreddits
  
end
