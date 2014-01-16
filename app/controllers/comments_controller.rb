class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      render :json => @comment.errors.full_messages
    end
  end
  
end
