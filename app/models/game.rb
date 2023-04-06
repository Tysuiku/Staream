class Game < ApplicationRecord
  validates_presence_of :name, :price, :genre, :detail, :description

  has_many_attached :images
end
