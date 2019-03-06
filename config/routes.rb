Rails.application.routes.draw do
  resources :orders
  resources :tables
  
  root 'tables#index'
  
end
