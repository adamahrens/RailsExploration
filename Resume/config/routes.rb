# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /login(.:format)               devise/sessions#new
#             user_session POST   /login(.:format)               devise/sessions#create
#     destroy_user_session DELETE /logout(.:format)              devise/sessions#destroy
#        new_user_password GET    /password/new(.:format)        devise/passwords#new
#       edit_user_password GET    /password/edit(.:format)       devise/passwords#edit
#            user_password PATCH  /password(.:format)            devise/passwords#update
#                          PUT    /password(.:format)            devise/passwords#update
#                          POST   /password(.:format)            devise/passwords#create
# cancel_user_registration GET    /cancel(.:format)              devise/registrations#cancel
#    new_user_registration GET    /register(.:format)            devise/registrations#new
#   edit_user_registration GET    /edit(.:format)                devise/registrations#edit
#        user_registration PATCH  /                              devise/registrations#update
#                          PUT    /                              devise/registrations#update
#                          DELETE /                              devise/registrations#destroy
#                          POST   /                              devise/registrations#create
#               portfolios GET    /portfolios(.:format)          portfolios#index
#                          POST   /portfolios(.:format)          portfolios#create
#            new_portfolio GET    /portfolios/new(.:format)      portfolios#new
#           edit_portfolio GET    /portfolios/:id/edit(.:format) portfolios#edit
#                portfolio PATCH  /portfolios/:id(.:format)      portfolios#update
#                          PUT    /portfolios/:id(.:format)      portfolios#update
#                          DELETE /portfolios/:id(.:format)      portfolios#destroy
#           show_portfolio GET    /portfolio/:id(.:format)       portfolios#show
#           portfolio_sort PUT    /portfolio/sort(.:format)      portfolios#sort
#           publicize_blog POST   /blogs/:id/publicize(.:format) blogs#publicize
#                    blogs GET    /blogs(.:format)               blogs#index
#                          POST   /blogs(.:format)               blogs#create
#                 new_blog GET    /blogs/new(.:format)           blogs#new
#                edit_blog GET    /blogs/:id/edit(.:format)      blogs#edit
#                     blog GET    /blogs/:id(.:format)           blogs#show
#                          PATCH  /blogs/:id(.:format)           blogs#update
#                          PUT    /blogs/:id(.:format)           blogs#update
#                          DELETE /blogs/:id(.:format)           blogs#destroy
#                     home GET    /home(.:format)                pages#home
#                    about GET    /about(.:format)               pages#about
#                  contact GET    /contact(.:format)             pages#contact
#                     root GET    /                              pages#home
#
Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             sign_up: 'register' }
  resources :portfolios, except: [:show]

  # adds show_portfolio_path
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  put 'portfolio/sort', to: 'portfolios#sort'

  resources :blogs do
    member do
      post :publicize
    end
  end

  # controller/action mapping
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  root to: 'pages#home'
end
