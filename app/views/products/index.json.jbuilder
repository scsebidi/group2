json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :unit_price, :quantity, :manufacturer_id, :category_id, :created_at, :updated_at, :views, :available_size, :available_color, :quantity_sold
  json.url product_url(product, format: :json)
end
