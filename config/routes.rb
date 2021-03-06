Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'follow', to: 'users#follow', as: 'follow'
  end

  root to: 'pages#home'
  get '/user/requests/', to: 'pages#requests', as: 'user_requests'
  get '/search/', to: 'pages#search', as: 'search'
  get 'category', to: 'requests#category', as: 'category'


  resources :assignments, only: [:create, :update, :destroy]
  resources :reviews, only: [:new, :create]

  resources :requests do
    get 'favorite', to: 'requests#favorite', as: 'favorite'
  end

  resources :chatrooms, only: [:index, :create, :show, :destroy] do
    resources :messages, only: :create
  end

  resources :pictures, only: :destroy
end
