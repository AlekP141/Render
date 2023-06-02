class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  has_one :review, dependent: :delete

  validates :user_id, presence: true
  validates :artwork_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # artwork is assigned to a user, start/end date is assigned

  validate :validate_dates_order



  private

  def validate_dates_order
    return if start_date.blank? || end_date.blank?

    errors.add(:end_date, "must be after start date") if end_date <= start_date
  end
end
