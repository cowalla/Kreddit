class VotesController < ApplicationController
  
  def create
    if !!current_user
      subreddit_id = params[:vote][:subreddit_id]
      params[:vote].delete(:subreddit_id)
      
      @vote = Vote.new(params[:vote])
      user_comment_vote = Vote.find_by_comment_id(@vote.comment_id)
      user_link_vote = Vote.find_by_link_id(@vote.link_id)
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts params
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      if @vote.save
        if !!@vote.link_id
          user_link_vote.destroy if !!user_link_vote
          redirect_to subreddit_url(subreddit_id)
        else
          user_comment_vote.destroy if !!user_comment_vote
          redirect_to subreddit_url(subreddit_id)
        end
      else
        render :json => @errors.full_messages
      end
    else
      redirect_to new_session_url
    end
  end
  
  def destroy
  end
  
end
