# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#      home GET    /home(.:format)           pages#home
#      root GET    /                         pages#home
# 

Rails.application.routes.draw do
  resources :posts
  get 'home', to: 'pages#home'
  root 'pages#home'
end
