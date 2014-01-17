class CommentsController < ApplicationController
  
  def create
    if !!current_user
      params[:comment][:parent_comment_id] ||= nil
      params[:comment][:user_id] = current_user.id
      puts "++++++++++"
       puts params[:comment]
        puts "++++++++++"
      @comment = Comment.new(params[:comment])
      if @comment.save
        redirect_to link_url(@comment.link)
      else
        render :json => @comment.errors.full_messages
      end
    else
      redirect_to new_session_url
    end
  end
  
end
