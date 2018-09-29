Rails.application.routes.draw do
  resources :records
  resources :tags
  resources :groups
  #resources :comments
  #resources :posts
  resources :users
  resources :file_types

  resources :services

  resources :posts do
    resources :comments, only: [:create,:destroy,:update, :show]
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
