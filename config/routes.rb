Rails.application.routes.draw do
  root 'orders#index'
  resources :orders, only: %i[new create edit update destroy]
end
