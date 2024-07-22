json.extract! customer, :id, :phone_number, :email, :last_name, :first_name, :address, :orders_count, :created_at, :updated_at
json.url customer_url(customer, format: :json)
