Rails.application.routes.draw do
  resources :listings
  root 'listings#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
