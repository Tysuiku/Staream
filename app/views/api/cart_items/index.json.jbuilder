json.array! @cart_items do |cart_item|
  json.id cart_item.id
  json.user_id cart_item.user_id
  json.game_id cart_item.game_id
  json.purchased cart_item.purchased
  json.created_at cart_item.created_at
  json.updated_at cart_item.updated_at

  json.game do
    json.id cart_item.game.id
    json.name cart_item.game.name
    json.price cart_item.game.price
  end
end
