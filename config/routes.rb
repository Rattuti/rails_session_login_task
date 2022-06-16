Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks

  resources :session, only: [:new, :create, :destroy]
  resources :users
end
