Rails.application.routes.draw do
  # Static controller for home page
  get 'home/index'

  # Generate routes for posts #index, #new, #edit, etc
  resources :posts
  resources :categories

  # / is the root of the page. Route it to the HomeController#index
  root 'home#index'
end
