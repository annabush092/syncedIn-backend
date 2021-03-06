Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :families, only: [:index]
      resources :posts, only: [:index, :create]
      resources :tags, only: [:index]

      resources :users, only: [:index, :create, :update]
      resources :user_follows, only: [:create]
      post '/delete_user_follows', to: 'user_follows#delete_follow'

      resources :authentications, only: [:index]
      post '/login', to: 'authentications#login'
    end
  end

end
