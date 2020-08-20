Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'homes#index'
  resources :users
  resources :topics, only: :index
  resources :menus, only: :index
  resources :events, only: :index
  resources :skills
  resources :rooms
end
