# == Route Map
#
#                Prefix Verb   URI Pattern                           Controller#Action
#           admin_users GET    /admin/users(.:format)                admin/users#index
#                       POST   /admin/users(.:format)                admin/users#create
#        new_admin_user GET    /admin/users/new(.:format)            admin/users#new
#       edit_admin_user GET    /admin/users/:id/edit(.:format)       admin/users#edit
#            admin_user GET    /admin/users/:id(.:format)            admin/users#show
#                       PATCH  /admin/users/:id(.:format)            admin/users#update
#                       PUT    /admin/users/:id(.:format)            admin/users#update
#                       DELETE /admin/users/:id(.:format)            admin/users#destroy
#       admin_time_offs GET    /admin/time_offs(.:format)            admin/time_offs#index
#                       POST   /admin/time_offs(.:format)            admin/time_offs#create
#    new_admin_time_off GET    /admin/time_offs/new(.:format)        admin/time_offs#new
#   edit_admin_time_off GET    /admin/time_offs/:id/edit(.:format)   admin/time_offs#edit
#        admin_time_off GET    /admin/time_offs/:id(.:format)        admin/time_offs#show
#                       PATCH  /admin/time_offs/:id(.:format)        admin/time_offs#update
#                       PUT    /admin/time_offs/:id(.:format)        admin/time_offs#update
#                       DELETE /admin/time_offs/:id(.:format)        admin/time_offs#destroy
#     admin_admin_users GET    /admin/admin_users(.:format)          admin/admin_users#index
#                       POST   /admin/admin_users(.:format)          admin/admin_users#create
#  new_admin_admin_user GET    /admin/admin_users/new(.:format)      admin/admin_users#new
# edit_admin_admin_user GET    /admin/admin_users/:id/edit(.:format) admin/admin_users#edit
#      admin_admin_user GET    /admin/admin_users/:id(.:format)      admin/admin_users#show
#                       PATCH  /admin/admin_users/:id(.:format)      admin/admin_users#update
#                       PUT    /admin/admin_users/:id(.:format)      admin/admin_users#update
#                       DELETE /admin/admin_users/:id(.:format)      admin/admin_users#destroy
#            admin_root GET    /admin(.:format)                      admin/users#index
#            user_index GET    /user/index(.:format)                 user#index
#             time_offs GET    /time_offs(.:format)                  time_offs#index
#                       POST   /time_offs(.:format)                  time_offs#create
#          new_time_off GET    /time_offs/new(.:format)              time_offs#new
#         edit_time_off GET    /time_offs/:id/edit(.:format)         time_offs#edit
#              time_off GET    /time_offs/:id(.:format)              time_offs#show
#                       PATCH  /time_offs/:id(.:format)              time_offs#update
#                       PUT    /time_offs/:id(.:format)              time_offs#update
#                       DELETE /time_offs/:id(.:format)              time_offs#destroy
#      new_user_session GET    /users/sign_in(.:format)              devise/sessions#new
#          user_session POST   /users/sign_in(.:format)              devise/sessions#create
#  destroy_user_session DELETE /users/sign_out(.:format)             devise/sessions#destroy
#     new_user_password GET    /users/password/new(.:format)         devise/passwords#new
#    edit_user_password GET    /users/password/edit(.:format)        devise/passwords#edit
#         user_password PATCH  /users/password(.:format)             devise/passwords#update
#                       PUT    /users/password(.:format)             devise/passwords#update
#                       POST   /users/password(.:format)             devise/passwords#create
#       static_homepage GET    /static/homepage(.:format)            static#homepage
#                  root GET    /                                     static#homepage
#

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :time_offs
    resources :admin_users
    root to: "users#index"
  end

  get 'user/index'
  get 'static/homepage'
  resources :time_offs
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
