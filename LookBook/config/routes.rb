Rails.application.routes.draw do
  resources :posts
  get 'home', to: 'pages#home'
  root 'pages#home'
end
