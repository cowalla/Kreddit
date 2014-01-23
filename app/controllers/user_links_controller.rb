class UserLinksController < ApplicationController
  
  def index
    if !!current_user
      @user_links = UserLink.where({:user_id => current_user.id})
      render :json => @user_links
    else
      redirect_to new_session_end
    end
  end
  
  def show
    if !!current_user
      @user_link = UserLink.where({:user_id => current_user.id, :link_id => params[:user_link][:link_id]})
      render :json => @user_link=
    end
  end
  
  
  def create
    if !!current_user
      params[:user_link][:user_id] = current_user.id
      @user_link = UserLink.new(params[:user_link])
      if @user_link.save
        render :json => current_user.watched_links
      else
        render :json => @user_link.errors.full_messages
      end
    end
  end
  
  def destroy
    if !!current_user
      @user_link = UserLink.find_by_link_id_and_user_id(params[:user_link][:link_id], current_user.id)
      @user_link.destroy if !!@user_link
      redirect_to subreddit_url(@subreddit)
    end
  end
  
  
end
