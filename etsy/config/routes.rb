# == Route Map
#
#                   Prefix Verb   URI Pattern                                Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                   devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                   devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                  devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)              devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)             devise/passwords#edit
#            user_password PATCH  /users/password(.:format)                  devise/passwords#update
#                          PUT    /users/password(.:format)                  devise/passwords#update
#                          POST   /users/password(.:format)                  devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                    devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                   devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                      devise/registrations#edit
#        user_registration PATCH  /users(.:format)                           devise/registrations#update
#                          PUT    /users(.:format)                           devise/registrations#update
#                          DELETE /users(.:format)                           devise/registrations#destroy
#                          POST   /users(.:format)                           devise/registrations#create
#           listing_orders POST   /listings/:listing_id/orders(.:format)     orders#create
#        new_listing_order GET    /listings/:listing_id/orders/new(.:format) orders#new
#                 listings GET    /listings(.:format)                        listings#index
#                          POST   /listings(.:format)                        listings#create
#              new_listing GET    /listings/new(.:format)                    listings#new
#             edit_listing GET    /listings/:id/edit(.:format)               listings#edit
#                  listing GET    /listings/:id(.:format)                    listings#show
#                          PATCH  /listings/:id(.:format)                    listings#update
#                          PUT    /listings/:id(.:format)                    listings#update
#                          DELETE /listings/:id(.:format)                    listings#destroy
#                     root GET    /                                          listings#index
#                    about GET    /about(.:format)                           pages#about
#                  contact GET    /contact(.:format)                         pages#contact
#                   seller GET    /seller(.:format)                          listings#seller
#                    sales GET    /sales(.:format)                           orders#sales
#                purchases GET    /purchases(.:format)                       orders#purchases
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
  post 'transfer', to: 'orders#transfer'
end
