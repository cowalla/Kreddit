

ActiveRecord::Base.transaction do
  
  User.new(:username => "connor", :password => "connor").save!
  Subreddit.new(:title => "Main", :user_id => 1).save!
  Link.new(:url => "http://i.imgur.com/KHEiLJx.gif", :description => "Fuck it, I guess this is my life now", :user_id => 1, :subreddit_id => 1).save!
  Link.new(:url => "http://i.imgur.com/w0tX1rt.jpg", :description => "My cat is stupid and is ruining my chair", :user_id => 1, :subreddit_id => 1).save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "Extended gif: The man is okay, with a Network Rail employee pushing the emergency button to stop the escalator.").save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "We still have no proof he ever got up.").save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "Some say that he still lays there on the escalators to this very day.").save!
  
end
