Rails.application.routes.draw do
  devise_for :users

  resources :listings

  get 'seller', to: 'listings#seller'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  root 'listings#index'

end
