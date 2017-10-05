Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :time_offs
    resources :admin_users

    root to: "users#index"
  end

  get 'user/index'

  resources :time_offs
  devise_for :users, skip: [:registrations]
  get 'static/homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
