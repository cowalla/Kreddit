class SubredditLink < ActiveRecord::Base
  attr_accessible :subreddit_id, :link_id
  
  belongs_to :subreddit
  belongs_to :link
  
end
