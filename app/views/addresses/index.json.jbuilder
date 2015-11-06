json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :add_id, :street, :city, :zipcode, :addrType
  json.url address_url(address, format: :json)
end
