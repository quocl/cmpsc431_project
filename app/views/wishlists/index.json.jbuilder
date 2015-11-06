json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :id
  json.extract! wishlist, :id, :user_id, :name
  json.url wishlist_url(wishlist, format: :json)
end
