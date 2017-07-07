Rails.application.routes.draw do
  resources :time_offs
  devise_for :users
  get 'static/homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
