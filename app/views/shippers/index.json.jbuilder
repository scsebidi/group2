json.array!(@shippers) do |shipper|
  json.extract! shipper, :id, :shipper_name, :contact_number
  json.url shipper_url(shipper, format: :json)
end
