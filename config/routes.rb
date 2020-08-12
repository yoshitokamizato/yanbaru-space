Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'homes#index'
  resources :users 
  resources :topics, only: :index
  resources :menus, only: :index
  resources :events, only: :index
  resources :skills 
  resources :contact_mails, only: [:new, :create]
  # get '/contact_mails', to: 'contact_mails#create', as: 'complete_mail'
end
