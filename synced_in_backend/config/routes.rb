Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :families, only: [:index]
    end
  end

end
