class LinksController < ApplicationController
  
  def index
    @links = Link.all
    # render :json => @links
  end
  
  def show
    @link = Link.find(params[:id])
    redirect_to link_url(@link)
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to link_url(@link)
    else
      render :json => @link.errors.full_messages
    end
  end
  
  def destroy
    @link = Link.find(params[:link])
    @link.destroy if @link
    redirect_to "links#index"
  end
  
  
end
