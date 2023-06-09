class CartItem < ApplicationRecord
  validates :user_id, presence: true
  validates :game_id, uniqueness: { scope: :user_id }
  validate :not_already_purchased

  belongs_to :user
  belongs_to :game

  private

  def not_already_purchased
    errors.add(:purchased, "item has already been purchased") if purchased_was && purchased_changed?
  end
end
