json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :name, :product_type, :created_at
  json.url manufacturer_url(manufacturer, format: :json)
end
