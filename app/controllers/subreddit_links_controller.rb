class SubredditLinksController < ApplicationController
  
  def create
    @subreddit_link = SubredditLink.new(params[:subreddit_link])
    @subreddit_link.save
  end
  
end
