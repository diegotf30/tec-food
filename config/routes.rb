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
  resources :restaurant, only: [:show, :index] do
    get 'menu', :to => 'restaurant#menu'
    get 'daily_meal', :to => 'restaurant#daily_meal'
    get 'hours', :to => 'restaurant#hours'
    get 'waiting_time', :to => 'restaurant#waiting_time'
    post 'order', :to => 'restaurant#order'
    # get 'seating', :to => 'restaurant#seating'
  end
  resources :orders, only: [:index, :show]
end
