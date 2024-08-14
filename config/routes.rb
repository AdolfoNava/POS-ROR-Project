Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_for :users, :skip => [:registrations]
  unauthenticated do
    root "menus#landing", as: :landing
  end
  authenticated :user do
    root "menus#main", as: :main
  end
  get "database" => "menus#database"
  get "orders/new" => "orders#new", as: :new_order
  get "orders/new/:cust_id" => "orders#chosen", as: :returning_customer_order
  get 'users/index' => "users#index", as: :list_users
  get "orders/pay/:id" => "orders#payment", as: :payment
  resources :options
  resources :categories
  resources :customers
  resources :orders do
    collection do
      get 'search_customers/' => 'orders#new', as: :simple_search
    end
  end
  # resources :items

end
