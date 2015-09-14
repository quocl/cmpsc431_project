json.array!(@sale_items) do |sale_item|
  json.extract! sale_item, :id, :name, :description, :price, :location
  json.url sale_item_url(sale_item, format: :json)
end
