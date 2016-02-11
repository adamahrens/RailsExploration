# == Route Map
#
#       Prefix Verb   URI Pattern                     Controller#Action
#    companies GET    /companies(.:format)            companies#index
#              POST   /companies(.:format)            companies#create
#  new_company GET    /companies/new(.:format)        companies#new
# edit_company GET    /companies/:id/edit(.:format)   companies#edit
#      company GET    /companies/:id(.:format)        companies#show
#              PATCH  /companies/:id(.:format)        companies#update
#              PUT    /companies/:id(.:format)        companies#update
#              DELETE /companies/:id(.:format)        companies#destroy
#     projects GET    /projects(.:format)             projects#index
#              POST   /projects(.:format)             projects#create
#  new_project GET    /projects/new(.:format)         projects#new
# edit_project GET    /projects/:id/edit(.:format)    projects#edit
#      project GET    /projects/:id(.:format)         projects#show
#              PATCH  /projects/:id(.:format)         projects#update
#              PUT    /projects/:id(.:format)         projects#update
#              DELETE /projects/:id(.:format)         projects#destroy
#        works GET    /works(.:format)                works#index
#              POST   /works(.:format)                works#create
#     new_work GET    /works/new(.:format)            works#new
#    edit_work GET    /works/:id/edit(.:format)       works#edit
#         work GET    /works/:id(.:format)            works#show
#              PATCH  /works/:id(.:format)            works#update
#              PUT    /works/:id(.:format)            works#update
#              DELETE /works/:id(.:format)            works#destroy
#         root GET    /                               companies#index
#              GET    /recentworks/:days(.:format)    works#index
#              GET    /projecttracker/:slug(.:format) projects#show
#

Rails.application.routes.draw do

  resources :companies
  resources :projects
  resources :works

  root 'companies#index'

  # recentworks/10 => Last 10 days of Work
  get 'recentworks/:days' => 'works#index'
  get 'projecttracker/:slug' => 'projects#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
