class VotesController < ApplicationController
  
  def create
    if !!current_user
      @vote = Vote.new(params[:vote])
      if @vote.save
        puts "++++++++++++++"
        puts @vote.comment_id
        puts @vote.link_id
        puts "++++++++++++++"
        
        
        
        if !!@vote.link_id
          redirect_to links_url
        else
          redirect_to link_url(Link.find(Comment.find(@vote.comment_id).link_id))
        end
      end
    else
      redirect_to new_session_url
    end
  end
  
  def destroy
    
  end
  
end
