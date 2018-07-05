# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#     portfolios GET    /portfolios(.:format)          portfolios#index
#                POST   /portfolios(.:format)          portfolios#create
#  new_portfolio GET    /portfolios/new(.:format)      portfolios#new
# edit_portfolio GET    /portfolios/:id/edit(.:format) portfolios#edit
#      portfolio PATCH  /portfolios/:id(.:format)      portfolios#update
#                PUT    /portfolios/:id(.:format)      portfolios#update
#                DELETE /portfolios/:id(.:format)      portfolios#destroy
# show_portfolio GET    /portfolio/:id(.:format)       portfolios#show
# publicize_blog POST   /blogs/:id/publicize(.:format) blogs#publicize
#          blogs GET    /blogs(.:format)               blogs#index
#                POST   /blogs(.:format)               blogs#create
#       new_blog GET    /blogs/new(.:format)           blogs#new
#      edit_blog GET    /blogs/:id/edit(.:format)      blogs#edit
#           blog GET    /blogs/:id(.:format)           blogs#show
#                PATCH  /blogs/:id(.:format)           blogs#update
#                PUT    /blogs/:id(.:format)           blogs#update
#                DELETE /blogs/:id(.:format)           blogs#destroy
#           home GET    /home(.:format)                pages#home
#          about GET    /about(.:format)               pages#about
#        contact GET    /contact(.:format)             pages#contact
#           root GET    /                              pages#home
Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             sign_up: 'register' }
  resources :portfolios, except: [:show]

  # adds show_portfolio_path
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'

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
