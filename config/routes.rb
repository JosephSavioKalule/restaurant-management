Rails.application.routes.draw do

  resources :tables do
    resources :orders
  end
  
  resources :edibles
  
  root 'tables#index'
  
  get '/orders', to: 'orders#index'
  
end
