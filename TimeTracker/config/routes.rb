# == Route Map
#
#       Prefix Verb   URI Pattern                   Controller#Action
#    companies GET    /companies(.:format)          companies#index
#              POST   /companies(.:format)          companies#create
#  new_company GET    /companies/new(.:format)      companies#new
# edit_company GET    /companies/:id/edit(.:format) companies#edit
#      company GET    /companies/:id(.:format)      companies#show
#              PATCH  /companies/:id(.:format)      companies#update
#              PUT    /companies/:id(.:format)      companies#update
#              DELETE /companies/:id(.:format)      companies#destroy
#     projects GET    /projects(.:format)           projects#index
#              POST   /projects(.:format)           projects#create
#  new_project GET    /projects/new(.:format)       projects#new
# edit_project GET    /projects/:id/edit(.:format)  projects#edit
#      project GET    /projects/:id(.:format)       projects#show
#              PATCH  /projects/:id(.:format)       projects#update
#              PUT    /projects/:id(.:format)       projects#update
#              DELETE /projects/:id(.:format)       projects#destroy
#        works GET    /works(.:format)              works#index
#              POST   /works(.:format)              works#create
#     new_work GET    /works/new(.:format)          works#new
#    edit_work GET    /works/:id/edit(.:format)     works#edit
#         work GET    /works/:id(.:format)          works#show
#              PATCH  /works/:id(.:format)          works#update
#              PUT    /works/:id(.:format)          works#update
#              DELETE /works/:id(.:format)          works#destroy
#

Rails.application.routes.draw do
  root 'companies#index'
  get 'recentworks/:days', to: 'works#index'
  get 'venture/:slug', to: 'projects#show'
  resources :companies
  resources :projects
  resources :works
end
