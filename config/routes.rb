Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show,:new, :create] do
    resources :posts, only: [:index, :show, :new, :create,:destroy] do
      resources :comments, only: [:new, :create , :destroy]
      resources :likes, only: [:create, :new]
    end
  end

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

 
 
  root "users#index"
end
