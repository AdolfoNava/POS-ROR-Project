desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  Category.create(name: "Laundry")
  Option.create(name: "Shirt", base_price: 3.0, category: Category.first)
  User.create(admin: true, email: "admin@example.com", name: "TEST")
  Customer.create(first_name: "Test", last_name: "User")
end
