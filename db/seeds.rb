

ActiveRecord::Base.transaction do
  
  User.new(:username => "the_help", :password => "trytoguess").save!
  Subreddit.new(:title => "Main", :user_id => 1).save!
  
end

