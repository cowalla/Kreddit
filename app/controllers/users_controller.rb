class UsersController < ApplicationController
  
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
      @karma = 100
      @submitted_links = Link.where({:user_id => @user.id})
      @created_at = @user.created_at
    else
      @user = current_user
      @karma = 100
      @submitted_links = Link.where({:user_id => @user.id})
      @created_at = @user.created_at
      redirect_to user_url(current_user)
    end
  end
  
  
end
