# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#home'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'

  get 'posts', to: 'posts#index'
  post 'postcreate', to: 'posts#create'

  resources :posts, only: %i[new create posts]
end
