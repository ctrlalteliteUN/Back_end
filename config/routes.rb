Rails.application.routes.draw do
  resources :records
  resources :services
  resources :tags
  resources :groups
  resources :comments
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/listBooks' , to: 'books#listBooks'



end
