Rails.application.routes.draw do

  resources :categories do 
    resources :products, only: [:index, :show]
  end
  resources :products
end
