class UserLinksController < ApplicationController
  
  def index
      UserLink.create({:user_id => current_user.id, :link_id => 1})
      @user_links = UserLink.where({:user_id => current_user.id})
      render :json => @user_links
  end
  
  def show
      @user_link = UserLink.where({:user_id => current_user.id, :link_id => params[:user_link][:link_id]})
      render :json => @user_link
  end
  
  
  def create
      params[:user_link][:user_id] = current_user.id
      params[:user_link][:avatar] = Link.find(params[:user_link][:link_id]).avatar(:thumb)
      @user_link = UserLink.new(params[:user_link])
      if @user_link.save
        render :json => @user_link
        #current_user.watched_links
      else
        render :json => @user_link.errors.full_messages
      end
  end
  
  def destroy
      @user_link = UserLink.find(params[:id])
      @user_link.destroy if !!@user_link
      render :json => {}
  end
  
  
end
