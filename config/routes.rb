Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show,:new, :create] do
    resources :posts, only: [:index, :show, :new, :create,:destroy] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :new]
    end
  end
 
 
  root "users#index"
end
