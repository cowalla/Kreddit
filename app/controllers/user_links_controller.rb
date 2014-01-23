class UserLinksController < ApplicationController
  
  def index
    @user_links = UserLink.where({:user_id => current_user.id})
    render :json => @user_links
  end
  
  def show
    @user_link = UserLink.where({:user_id => current_user.id, :link_id => params[:user_link][:link_id]})
    render :json => @user_link
  end
  
  
  def create
    params[:user_link][:user_id] = current_user.id
    @user_link = UserLink.new(params[:user_link])
    if @user_link.save
      render :json => current_user.watched_links
    else
      render :json => @user_link.errors.full_messages
    end
  end
  
  def destroy
    params[:user_link][:user_id] = current_user.id
    @user_link = UserLink.find(params[:user_link])
    @user_link.destroy if !!@user_link
    render :json => current_user.watched_links
  end
  
  
end
