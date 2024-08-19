# frozen_string_literal: true

unless Rails.env.production?
  namespace :dev do
    task reset: [
      :environment,
      'db:drop',
      'db:create',
      'db:migrate',
      'dev:sample_data'
    ]
  end

  desc "Fill the database tables with some sample data"
  task({ :sample_data => :environment }) do
    Category.create(name: "Laundry")
    Category.create(name: "Dry")
    Option.create(name: "Shirt", base_price: 3.0, category: Category.first)
    Option.create(name: "Pants", base_price: 5.0, category: Category.last)
    User.create(admin: true, email: "admin@example.com", name: "TEST")
    Customer.create(first_name: "Test", last_name: "User")
  end
end
