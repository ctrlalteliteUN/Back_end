Rails.application.routes.draw do

  resources :app_files
  resources :records
  resources :tags
  resources :groups
  #resources :comments
  #resources :posts
  resources :users
  resources :file_types

  resources :users do
    resources :records
  end

  #revisar
  resources :services

  resources :posts do
    resources :comments #, only: [:create,:destroy,:update, :show]
    resources :tags
  end

  resources :comments

  resources :groups do
    resources :posts
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
