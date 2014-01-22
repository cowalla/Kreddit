

ActiveRecord::Base.transaction do
  
  User.new(:username => "SeedyMcSeedSeed", :password => "seedseedseedseed").save!
  Subreddit.new(:title => "Main", :user_id => 1).save!
  Subreddit.new(:title => "Pics", :user_id => 1).save!
  Subreddit.new(:title => "Funny", :user_id => 1).save!
  Subreddit.new(:title => "Gaming", :user_id => 1).save!
  Subreddit.new(:title => "AsKreddit", :user_id => 1).save!
  Subreddit.new(:title => "WorldNews", :user_id => 1).save!
  Subreddit.new(:title => "News", :user_id => 1).save!
  Subreddit.new(:title => "Videos", :user_id => 1).save!
  Subreddit.new(:title => "IAMA", :user_id => 1).save!
  
end

