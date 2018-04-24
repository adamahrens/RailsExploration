# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#     blogs GET    /blogs(.:format)          blogs#index
#           POST   /blogs(.:format)          blogs#create
#  new_blog GET    /blogs/new(.:format)      blogs#new
# edit_blog GET    /blogs/:id/edit(.:format) blogs#edit
#      blog GET    /blogs/:id(.:format)      blogs#show
#           PATCH  /blogs/:id(.:format)      blogs#update
#           PUT    /blogs/:id(.:format)      blogs#update
#           DELETE /blogs/:id(.:format)      blogs#destroy
#

Rails.application.routes.draw do
  resources :portfolios
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  resources :blogs
end
