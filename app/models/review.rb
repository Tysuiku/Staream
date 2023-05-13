class Review < ApplicationRecord
  validates_presence_of :author_id, :game_id, :body
  validates :recommended, inclusion: { in: [true, false] }
  validates :author_id, uniqueness: { scope: :game_id, message: "has already reviewed this game" }

  belongs_to :author,
    class_name: :User

  belongs_to :game

  has_many :review_votes
end
