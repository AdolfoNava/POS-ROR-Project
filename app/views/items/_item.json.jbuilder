json.extract! item, :id, :quantity, :name, :price, :order_id, :created_at, :updated_at
json.url item_url(item, format: :json)
