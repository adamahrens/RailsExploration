# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#     listings GET    /listings(.:format)          listings#index
#              POST   /listings(.:format)          listings#create
#  new_listing GET    /listings/new(.:format)      listings#new
# edit_listing GET    /listings/:id/edit(.:format) listings#edit
#      listing GET    /listings/:id(.:format)      listings#show
#              PATCH  /listings/:id(.:format)      listings#update
#              PUT    /listings/:id(.:format)      listings#update
#              DELETE /listings/:id(.:format)      listings#destroy
#         root GET    /                            listings#index
#        about GET    /about(.:format)             pages#about
#      contact GET    /contact(.:format)           pages#contact
#

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  root 'listings#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
