class Artwork < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo

  # validates :user, presence: true
  #  artwork belongs to a user validating the precence of the user_id attr
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  #  artwork price is not a negative number but also gives a nil price to artworks should it be free?
  validates :address, presence: true, length: { maximum: 300 }
  validates :name, presence: true, length: { maximum: 200 }
  #  name / address does not exceed  characters
  validates :description, presence: true
  validates :average_rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }, allow_nil: true
  #  the average rating  is between 0-5 but also allows it to be 0
  validates :height, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_nil: true
  validates :width, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_nil: true
  # that the height and width measurements are a positive number and no artwork without it cant be validated
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  scope :filter_by_price, ->(price) { where price: price}
  scope :filter_by_artist, ->(artist) { where artist: artist}
end
