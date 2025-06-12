Rails.application.routes.draw do

  resources :products
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resource :cart, only: [:show] do
  post 'add_item/:product_id', to: 'carts#add_item', as: 'add_item'
  delete 'remove_item/:product_id', to: 'carts#remove_item', as: 'remove_item'
  delete 'empty', to: 'carts#empty', as: 'empty'
end

  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
