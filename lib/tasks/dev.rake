unless Rails.env.production?
  namespace :dev do
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]
  end
  # would be good to add logging to confirm what data was added
  # need to add a phone number to customer
  desc "Fill the database tables with some sample data"
  task({ :sample_data => :environment }) do
    Category.create(name: "Laundry")
    Category.create(name: "Dry")
    Option.create(name: "Shirt", base_price: 3.0, category: Category.first)
    Option.create(name: "Pants", base_price: 5.0, category: Category.last)
    User.create(admin: true, email: "admin@example.com", name: "TEST", password: "password")
    Customer.create(first_name: "Test", last_name: "User", phone_number: "1234567891", email: "fake@fake.com")
  end
end
