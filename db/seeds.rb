

ActiveRecord::Base.transaction do
  User.new(:username => "connor", :password => "connor").save!
  Subreddit.new(:title => "Main", :user_id => 1).save!
  Link.new(:url => "www.google.com", :description => "Google!", :user_id => 1, :subreddit_id => 1).save!
  Link.new(:url => "www.google.com", :description => "Google!", :user_id => 1, :subreddit_id => 1).save!
end
