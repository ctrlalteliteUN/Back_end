# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                 app_files GET    /app_files(.:format)                                                                     app_files#index
#                           POST   /app_files(.:format)                                                                     app_files#create
#                  app_file GET    /app_files/:id(.:format)                                                                 app_files#show
#                           PATCH  /app_files/:id(.:format)                                                                 app_files#update
#                           PUT    /app_files/:id(.:format)                                                                 app_files#update
#                           DELETE /app_files/:id(.:format)                                                                 app_files#destroy
#                   records GET    /records(.:format)                                                                       records#index
#                           POST   /records(.:format)                                                                       records#create
#                    record GET    /records/:id(.:format)                                                                   records#show
#                           PATCH  /records/:id(.:format)                                                                   records#update
#                           PUT    /records/:id(.:format)                                                                   records#update
#                           DELETE /records/:id(.:format)                                                                   records#destroy
#                    groups GET    /groups(.:format)                                                                        groups#index
#                           POST   /groups(.:format)                                                                        groups#create
#                     group GET    /groups/:id(.:format)                                                                    groups#show
#                           PATCH  /groups/:id(.:format)                                                                    groups#update
#                           PUT    /groups/:id(.:format)                                                                    groups#update
#                           DELETE /groups/:id(.:format)                                                                    groups#destroy
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                file_types GET    /file_types(.:format)                                                                    file_types#index
#                           POST   /file_types(.:format)                                                                    file_types#create
#                 file_type GET    /file_types/:id(.:format)                                                                file_types#show
#                           PATCH  /file_types/:id(.:format)                                                                file_types#update
#                           PUT    /file_types/:id(.:format)                                                                file_types#update
#                           DELETE /file_types/:id(.:format)                                                                file_types#destroy
#              user_records GET    /users/:user_id/records(.:format)                                                        records#index
#                           POST   /users/:user_id/records(.:format)                                                        records#create
#               user_record GET    /users/:user_id/records/:id(.:format)                                                    records#show
#                           PATCH  /users/:user_id/records/:id(.:format)                                                    records#update
#                           PUT    /users/:user_id/records/:id(.:format)                                                    records#update
#                           DELETE /users/:user_id/records/:id(.:format)                                                    records#destroy
#                           GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                           GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                  services GET    /services(.:format)                                                                      services#index
#                           POST   /services(.:format)                                                                      services#create
#                   service GET    /services/:id(.:format)                                                                  services#show
#                           PATCH  /services/:id(.:format)                                                                  services#update
#                           PUT    /services/:id(.:format)                                                                  services#update
#                           DELETE /services/:id(.:format)                                                                  services#destroy
#             post_comments GET    /posts/:post_id/comments(.:format)                                                       comments#index
#                           POST   /posts/:post_id/comments(.:format)                                                       comments#create
#              post_comment GET    /posts/:post_id/comments/:id(.:format)                                                   comments#show
#                           PATCH  /posts/:post_id/comments/:id(.:format)                                                   comments#update
#                           PUT    /posts/:post_id/comments/:id(.:format)                                                   comments#update
#                           DELETE /posts/:post_id/comments/:id(.:format)                                                   comments#destroy
#                 post_tags GET    /posts/:post_id/tags(.:format)                                                           tags#index
#                           POST   /posts/:post_id/tags(.:format)                                                           tags#create
#                  post_tag GET    /posts/:post_id/tags/:id(.:format)                                                       tags#show
#                           PATCH  /posts/:post_id/tags/:id(.:format)                                                       tags#update
#                           PUT    /posts/:post_id/tags/:id(.:format)                                                       tags#update
#                           DELETE /posts/:post_id/tags/:id(.:format)                                                       tags#destroy
#                     posts GET    /posts(.:format)                                                                         posts#index
#                           POST   /posts(.:format)                                                                         posts#create
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#                  comments GET    /comments(.:format)                                                                      comments#index
#                           POST   /comments(.:format)                                                                      comments#create
#                   comment GET    /comments/:id(.:format)                                                                  comments#show
#                           PATCH  /comments/:id(.:format)                                                                  comments#update
#                           PUT    /comments/:id(.:format)                                                                  comments#update
#                           DELETE /comments/:id(.:format)                                                                  comments#destroy
#               group_posts GET    /groups/:group_id/posts(.:format)                                                        posts#index
#                           POST   /groups/:group_id/posts(.:format)                                                        posts#create
#                group_post GET    /groups/:group_id/posts/:id(.:format)                                                    posts#show
#                           PATCH  /groups/:group_id/posts/:id(.:format)                                                    posts#update
#                           PUT    /groups/:group_id/posts/:id(.:format)                                                    posts#update
#                           DELETE /groups/:group_id/posts/:id(.:format)                                                    posts#destroy
#                           GET    /groups(.:format)                                                                        groups#index
#                           POST   /groups(.:format)                                                                        groups#create
#                           GET    /groups/:id(.:format)                                                                    groups#show
#                           PATCH  /groups/:id(.:format)                                                                    groups#update
#                           PUT    /groups/:id(.:format)                                                                    groups#update
#                           DELETE /groups/:id(.:format)                                                                    groups#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  resources :app_files
  resources :records
  #resources :tags
  resources :groups
  #resources :comments
  #resources :posts
  #resources :users
  resources :file_types

  resources :sessions, only:[:create,:destroy], defaults:{format: :json}

  resources :users do
    resources :records
  end

  #revisar
  resources :services

  resources :posts do
    resources :comments #, only: [:create,:destroy,:update, :show]
    resources :tags
    get :download_resume
  end

  resources :comments

  resources :groups do
    resources :posts
  end

  devise_for :users, defaults: { format: :json }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
