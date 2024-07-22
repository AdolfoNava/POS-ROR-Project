json.extract! order, :id, :price, :due_date, :customer_id, :employee_id, :payment_method, :status, :pre_paid, :items_count, :created_at, :updated_at
json.url order_url(order, format: :json)
