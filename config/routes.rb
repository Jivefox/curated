Rails.application.routes.draw do
  
  root to: 'products#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_facebook_user_session
  # end

  namespace :admin do
    resources :users, only: [:show]
  end
  
  resources :categories do 
    resources :products, only: [:index]
  end
  
  resources :users, only: [:show]

  resources :products
end
