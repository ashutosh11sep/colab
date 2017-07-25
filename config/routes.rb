Rails.application.routes.draw do
 
   devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 
     match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  #devise_for :users
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :posts
    
  root 'welcome#index'

   get "/tagging" => "posts#tag"
 
 resources :post do
    member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end

  end

resources :posts do
    resources :endorsements
end


  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
end

get "user/profile" => "users#show"
get "user/follow" => "users#follow"
get "user/unfollow" => "users#unfollow"
get "user/following" => "follows#following"
get "user/follower" => "follows#follower"



resources :users do
  resources :follows

end
resources :friendships, only: [:create, :update, :destroy]


end
