Rails.application.routes.draw do
  root to: "menus#main"
  get "customers/simple" => "customers#search_in_new_order", as: :find_customer
  get "orders/new" => "orders#new", as: :new_order
  get "orders/new/:id" => "orders#new" as: :order
  resources :options
  resources :categories
  devise_for :users
  resources :customers
  resources :orders
  resources :items

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

end
