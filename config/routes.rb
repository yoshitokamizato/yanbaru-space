Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'homes#index'
  resources :users
  resources :topics, only: :index
  resources :menus, only: :index
end
