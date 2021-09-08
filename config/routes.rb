Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: "registrations" }



  resources :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    end

  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  
    root "users#index"
end
