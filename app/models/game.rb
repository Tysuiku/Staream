class Game < ApplicationRecord
  validates_presence_of :name, :price, :genre, :detail, :description, :developer, :publisher, :release_date

  has_one_attached :main_image
  has_one_attached :game_image1
  has_one_attached :game_image2
  has_one_attached :game_image3
  has_one_attached :game_image4

  has_many :reviews

  def average_score
    num_positive = reviews.count { |review| review.recommended } * 100.0
    (num_positive / num_reviews)
  end

  def num_reviews
    reviews.length
  end
end
