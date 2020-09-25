Rails.application.routes.draw do
  
  root to: 'static#home'
  devise_for :users

  resources :categories do 
    resources :products, only: [:index]
  end
  resources :products
end
