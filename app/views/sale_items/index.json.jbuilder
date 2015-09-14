json.array!(@sale_items) do |sale_item|
  json.extract! sale_item, :id, :item_name, :item_description, :item_price, :item_location
  json.url sale_item_url(sale_item, format: :json)
end
