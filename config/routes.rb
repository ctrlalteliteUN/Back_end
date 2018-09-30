Rails.application.routes.draw do
  #resources :comments
  #resources :posts

  resources :users do
    resources :records
  end

  resources :services
  
  resources :posts do
    resources :comments, only: [:create,:destroy,:update, :show]
    resources :tags
  end

  resources :groups do
    resources :posts
  end







  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
