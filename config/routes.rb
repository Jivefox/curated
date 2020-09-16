Rails.application.routes.draw do

  resources :categories do 
    resources :products, only: [:index]
  end
  resources :products
end
