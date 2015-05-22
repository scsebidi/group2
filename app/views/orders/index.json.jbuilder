json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :email, :name, :address, :pay_type, :created_at, :updated_at, :order_status
  json.url order_url(order, format: :json)
end
