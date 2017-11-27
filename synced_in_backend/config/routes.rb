Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update]
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :families, only: [:index]
      resources :user_follows, only: [:create]
      post '/delete_user_follows', to: 'user_follows#delete_follow'
      post '/login', to: 'authentications#login'
    end
  end

end
