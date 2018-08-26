Rails.application.routes.draw do
  # namespace :admin do
  #   resources :members
  #   resources :groups
  #   resources :sectors
  #   resources :cities
  #   resources :countries

  #   root 'members#index'
  # end

  # authenticated :member do
  #   root 'countries#index', as: :authenticated_root
  # end

  root 'root#show'

  namespace :onboarding do
    resource :verification, only: [:show]
  end

  resources :users, only: [:show, :new]

  resources :restaurant, only: [:show]
end
