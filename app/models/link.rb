class Link < ActiveRecord::Base
  attr_accessible :url, :description, :user_id, :subreddit_id
  
  belongs_to :user
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

  def self.comment_render(comment_hash)
    comment_hash.each do |parent_comment, children_array|
      if !children_array.empty?
        render partial: "comment", locals: { parent: parent_comment, children: children_array }
      else
        render partial: "lonely", locals: { ronin_comment: parent_comment }
      end
    end
  end
  
end
