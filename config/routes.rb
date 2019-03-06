Rails.application.routes.draw do
  
  resources :tables do
    resources :orders
  end
  
  root 'tables#index'
  
end
