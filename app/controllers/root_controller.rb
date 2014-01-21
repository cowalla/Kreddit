class RootController < ApplicationController
  def root
    redirect_to subreddit_url(Subreddit.find(1))
  end
end
