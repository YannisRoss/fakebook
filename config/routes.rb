Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts

  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  
    root "users#index"
end
