

ActiveRecord::Base.transaction do
  
  User.new(:username => "connor", :password => "trytoguess").save!
  Subreddit.new(:title => "Main", :user_id => 1).save!
  Link.new(:url => "http://i.imgur.com/KHEiLJx.gif", :description => "Fuck it, I guess this is my life now", :user_id => 1, :subreddit_id => 1).save!
  Link.new(:url => "http://i.imgur.com/GCZ8L80.jpg", :description => "Great reference in LEGO Marvel Superheroes", :user_id => 1, :subreddit_id => 1).save!
  Link.new(:url => "http://i.imgur.com/TdnhtbS.jpg", :description => "Hey, whacha thinkin bout?", :user_id => 1, :subreddit_id => 1).save!
  Link.new(:url => "http://i.imgur.com/w0tX1rt.jpg", :description => "My cat is stupid and is ruining my chair", :user_id => 1, :subreddit_id => 1).save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "Extended gif: The man is okay, with a Network Rail employee pushing the emergency button to stop the escalator.", :parent_comment_id => nil).save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "We still have no proof he ever got up.", :parent_comment_id => 1).save!
  Comment.new(:user_id => 1, :link_id => 1, :body => "Some say that he still lays there on the escalators to this very day.", :parent_comment_id => 2).save!


  # 20.times do
  #    User.create!(:username => Faker::Internet.user_name, :password => "qazqazqaz")
  #    e = Faker::Internet.domain_name
  #    Link.create!(:url => e, :description => Faker::Lorem.sentence, :user_id => 1, :subreddit_id => 1)
  #    Link.create!({:url => Faker::Internet.domain_name, :description => Faker::Lorem.sentence, :user_id => 1, :subreddit_id => 1})
  #    Comment.create!({:user_id => 1, :link_id => 1, :body => Faker::Lorem.paragraph, :parent_comment_id => nil})
  #    Comment.create!(:user_id => 1, :link_id => 1, :body => Faker::Lorem.paragraph, :parent_comment_id => 1)
  #  end
    
end

