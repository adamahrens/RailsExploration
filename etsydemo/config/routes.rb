# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                 listings GET    /listings(.:format)            listings#index
#                          POST   /listings(.:format)            listings#create
#              new_listing GET    /listings/new(.:format)        listings#new
#             edit_listing GET    /listings/:id/edit(.:format)   listings#edit
#                  listing GET    /listings/:id(.:format)        listings#show
#                          PATCH  /listings/:id(.:format)        listings#update
#                          PUT    /listings/:id(.:format)        listings#update
#                          DELETE /listings/:id(.:format)        listings#destroy
#                   seller GET    /seller(.:format)              listings#seller
#                    about GET    /about(.:format)               pages#about
#                  contact GET    /contact(.:format)             pages#contact
#                     root GET    /                              listings#index
#

Rails.application.routes.draw do
  
  devise_for :users

  resources :listings do
    resources :orders
  end

  get 'seller', to: 'listings#seller'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  root 'listings#index'

end
