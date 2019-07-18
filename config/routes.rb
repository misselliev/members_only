Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  root 'sessions#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
end
