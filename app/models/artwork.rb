class Artwork < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  # ensures artwork belongs to a user validating the precence of the user_id attr
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # ensures artwork price is not a negative number but also gives a nil price to artworks should it be free?
  validates :address, presence: true, length: { maxinum: 300 }
  validates :name, precence: true, length: { maxinum: 200 }
  # ensures name / address does not exceed  characters
  validates :description, presence: true
  validates :average_rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }, allow_nil: true
  # ensures the average rating has is between 0-5 but also allows it to be 0
  validates :height, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_nil: true
  validates :width, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_nil: true
  # this also ensures that the height and width measurements are a positive number and no artwork without it cant be validated
end
