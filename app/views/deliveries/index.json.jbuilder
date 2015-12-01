json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :order_id, :user_id, :address_id, :card_id, :trackingnumber
  json.url delivery_url(delivery, format: :json)
end
