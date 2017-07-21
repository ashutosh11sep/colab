Rails.application.routes.draw do
  devise_for :users
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
end
