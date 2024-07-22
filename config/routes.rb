Rails.application.routes.draw do
  resources :options
  resources :categories
  devise_for :users
  resources :customers
  resources :orders
  resources :items

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  root to: "menus#main"
  
end
