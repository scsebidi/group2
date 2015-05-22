json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :company_name, :contact_email, :contact_number, :address, :suburb, :city, :province, :created_at
  json.url supplier_url(supplier, format: :json)
end
