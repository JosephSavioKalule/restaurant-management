Rails.application.routes.draw do

  resources :tables do
    resources :orders, shallow: true do
      resources :items
    end
  end
  
  resources :edibles
  
  root 'tables#index'
  
  get '/orders', to: 'orders#index'
  
end
