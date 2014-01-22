class LinksController < ApplicationController
  
  def index
    @links = Link.page(params[:page]).per(25)
  end
  
  def show
    @link = Link.find(params[:id])
    @comment_hash = Link.comment_hash_by_link_id(params[:id])
    @votes = @link.votes
    @upvotes = @votes.select{ |vote| vote.value == 1 }
    @downvotes = @votes.select{ |vote| vote.value == -1 }
    @link_karma = (@upvotes.count - @downvotes.count)
    @subreddit = Subreddit.new()
  end
  
  def new
    @link = Link.new
  end
  
  def create
    if !!current_user
      params[:link][:user_id] = current_user.id
      
      if !params[:link][:avatar]
        scrape = Grabbit.url(params[:link][:url])
        params[:link][:avatar] = scrape.images[0]
      end
      subLinks = params[:link][:subreddit_ids]
      params[:link].delete(:subreddit_ids)
      @link = Link.new(params[:link])

      if @link.save
        SubredditLink.new(:link_id => @link.id, :subreddit_id => 1).save
        SubredditLink.new(:link_id => @link.id, :subreddit_id => subLinks["1"]).save unless subLinks["1"] == ""
        SubredditLink.new(:link_id => @link.id, :subreddit_id => subLinks["2"]).save unless subLinks["2"] == ""
        SubredditLink.new(:link_id => @link.id, :subreddit_id => subLinks["3"]).save unless subLinks["3"] == ""
        redirect_to link_url(@link)
      else
        render :json => @link.errors.full_messages
      end
    else
      redirect_to new_session_url
    end
  end
  
  def destroy
    @link = Link.find(params[:link])
    @link.destroy if @link
    redirect_to "links#index"
  end
  
  
end
