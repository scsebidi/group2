json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :created_at
  json.url category_url(category, format: :json)
end
