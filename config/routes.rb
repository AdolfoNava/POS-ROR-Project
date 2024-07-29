Rails.application.routes.draw do
  root to: "menus#main"
  get "database" => "menus#database"
  get "orders/new" => "orders#new", as: :new_order
  get "customers/simple" => "customers#search_in_new_order", as: :find_customer
  get "orders/new/:cust_id" => "orders#new", as: :returning_customer_order
  get 'users/index' => "users#index", as: :list_users
  get "orders/pay/:order_id" => "orders#payment", as: :payment
  resources :options
  resources :categories
  devise_for :users
  resources :customers
  resources :orders
  resources :items

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

end
