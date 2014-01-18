class VotesController < ApplicationController
  
  def create
    if !!current_user
      @vote = Vote.new(params[:vote])
      user_comment_vote = Vote.where({:user_id => current_user.id, :comment_id => @vote.comment_id})
      user_link_vote = Vote.where({:user_id => current_user.id, :link_id => @vote.link_id})
      
      if !!user_comment_vote
        user_comment_vote.delete_all
      elsif user_link_vote
        user_link_vote.delete_all
      end
      
      if @vote.save
        if !!@vote.link_id
          redirect_to links_url
        else
          redirect_to link_url(Link.find(Comment.find(@vote.comment_id).link_id))
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
