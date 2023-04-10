class CartItem < ApplicationRecord
  validates :user_id, :purchased

  belongs_to :user
  belongs_to :game
end
