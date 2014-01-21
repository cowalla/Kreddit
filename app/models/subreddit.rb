class Subreddit < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :title, :user_id, :description
  
  belongs_to :user
  has_many :subreddit_links
  has_many :links, :through => :subreddit_links, :source => :link
  friendly_id :title
  
end
