class ReviewVote < ApplicationRecord
  validates_presence_of :user_id, :review_id
  validates :value, inclusion: { in: ["yes", "no"] }

  belongs_to :review
end
