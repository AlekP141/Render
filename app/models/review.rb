class Review < ApplicationRecord
  belongs_to :artwork
  belongs_to :user

  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }, allow_nil: true
  validates :comment, presence: true
  validates :user_id, presence: true
  validates :artwork_id, presence: true
end
