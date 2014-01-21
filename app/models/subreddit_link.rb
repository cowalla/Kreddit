class SubredditLink < ActiveRecord::Base
  attr_accessible :subreddit_id, :link_id
  validates_uniqueness_of :subreddit_id, :scope => [:link_id]
  
  belongs_to :subreddit
  belongs_to :link
  
  
end
