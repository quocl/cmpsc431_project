json.array!(@cards) do |card|
  json.extract! card, :id, :number, :name, :expiration, :card_type, :user_id
  json.url card_url(card, format: :json)
end
