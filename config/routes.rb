Rails.application.routes.draw do
  root 'orders#index'
  resources :orders, only: %i[new create edit update destroy]
  resources :order_product, only: %i[edit update create destroy]
end
