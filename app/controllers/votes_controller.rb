class VotesController < ApplicationController
  
  def create
    if !!current_user
      @subreddit_id = params[:vote][:subreddit_id]
      @link_id = params[:vote][:link_id]
      
      params[:vote].delete(:subreddit_id)
      params[:vote].delete(:link_id) if !!params[:vote][:comment_id]
      
      @vote = Vote.new(params[:vote])
      user_comment_vote = Vote.find_by_comment_id_and_user_id(@vote.comment_id, current_user.id)
      user_link_vote = Vote.find_by_link_id_and_user_id(@vote.link_id, current_user.id)
      if @vote.save
        if !!@vote.comment_id
          user_comment_vote.destroy if !!user_comment_vote
          redirect_to link_url(Link.find(@link_id))
        else
          user_link_vote.destroy if !!user_link_vote
          redirect_to subreddit_url(Subreddit.find(@subreddit_id))
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
