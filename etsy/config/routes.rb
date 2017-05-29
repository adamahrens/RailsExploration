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

  # Need to include listing_id for creating orders
  resources :listings do
    resources :orders, only: [:new, :create]
  end

  root 'listings#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'seller', to: 'listings#seller'
  get 'sales', to: 'orders#sales'
  get 'purchases', to: 'orders#purchases'
end
