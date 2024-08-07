Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  unauthenticated do
    root "menus#landing", as: :landing
  end
  authenticated :user do
    root "menus#main", as: :main
  end
  # get "main" => "menus#main", as: :main 
  get "database" => "menus#database"
  get "orders/new" => "orders#new", as: :new_order
  get "customers/simple" => "customers#search_in_new_order", as: :find_customer
  get "orders/new/:cust_id" => "orders#new", as: :returning_customer_order
  get 'users/index' => "users#index", as: :list_users
  get "orders/pay/:id" => "orders#payment", as: :payment
  resources :options
  resources :categories
  resources :customers
  resources :orders
  resources :items

end
