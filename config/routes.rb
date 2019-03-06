Rails.application.routes.draw do
  
  resources :tables do
    resources :orders
  end
  
  root 'tables#index'
  
  get '/orders', to: 'orders#index'
  
end
