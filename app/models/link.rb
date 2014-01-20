class Link < ActiveRecord::Base
  attr_accessible :url, :description, :user_id, :subreddit_id
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "50x50#" }, :default_url => "https://cdn3.iconfinder.com/data/icons/umar/Reddit.png"
  belongs_to :user
  has_many :votes
  has_many :comments, :dependent => :destroy
  belongs_to :subreddit
  
  def self.parent_comments(comments)
    parent_comments = []
    comments.each do |comment|
      parent_comments << comment if comment.parent_comment_id.nil?
    end
    return parent_comments
  end
   
  def self.comment_hash_by_link_id(link_id)
    comments = Comment.where({:link_id => link_id})
    parent_comments = Link.parent_comments(comments)
    return_hash = {}
    parent_comments.each do |comment|
      return_hash.merge!(Link.comment_children(comment))
    end
    return return_hash
  end
  
  def self.comment_children(comment)
    comment_hash = {}
    child_comments = comment.comments
    if child_comments.empty?
      comment_hash[comment] = nil
    else
      child_comments.each do |child_comment|
        if comment_hash[comment]
          comment_hash[comment].merge!(Link.comment_children(child_comment))
        else 
          comment_hash[comment] = Link.comment_children(child_comment)
        end
      end
    end
    return comment_hash
  end
  
end
