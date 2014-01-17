RedditClone::Application.routes.draw do

resources :users, :only => [:create, :new, :show]
resources :links, :only => [:create, :new, :show, :destroy, :index]
resources :subreddits, :only => [:create, :new, :show, :index]
resource :session, :only => [:new, :create, :destroy]
resources :comments, :only => [:create]
resources :votes, :only => [:create, :destroy]

root :to => "links#index"

end
