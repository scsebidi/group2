json.array!(@reviews) do |review|
  json.extract! review, :id, :username, :review, :product_id, :created_at
  json.url review_url(review, format: :json)
end
