class Game < ApplicationRecord
  validates_presence_of :name, :price, :genre, :detail, :description
end
