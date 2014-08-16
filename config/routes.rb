Club::Engine.routes.draw do
  resources :customers
  root 'customers#index'
end
