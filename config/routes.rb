Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'tasks#index'
  resources :tasks

  resources :session, only: [:new, :create, :destroy]
  resources :users
end
