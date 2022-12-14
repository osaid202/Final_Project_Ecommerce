json.extract! order, :id, :date, :price, :quantity, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
