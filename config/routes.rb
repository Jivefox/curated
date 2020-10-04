Rails.application.routes.draw do
  
  root to: 'products#index'
  devise_for :users
  resources :users, only: [:show]

  namespace :admin do
    resources :users, only: [:show]
  end

  resources :categories do 
    resources :products, only: [:index]
  end
  resources :products
end
