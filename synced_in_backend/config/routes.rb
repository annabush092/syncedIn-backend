Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :families, only: [:index]
      resources :posts, only: [:index]
      resources :tags, only: [:index]

      resources :users, only: [:index, :show, :create, :update]
      resources :user_follows, only: [:create]
      post '/delete_user_follows', to: 'user_follows#delete_follow'
      post '/login', to: 'authentications#login'
      get '/finduser', to: 'authentications#finduser'
    end
  end

end
