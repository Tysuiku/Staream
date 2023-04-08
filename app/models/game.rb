class Game < ApplicationRecord
  validates_presence_of :name, :price, :genre, :detail, :description, :developer, :publisher, :release_date

  has_one_attached :main_image
  has_one_attached :game_image1
  has_one_attached :game_image2
  has_one_attached :game_image3
  has_one_attached :game_image4
end
