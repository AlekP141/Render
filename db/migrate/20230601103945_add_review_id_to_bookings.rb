class AddReviewIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :review, foreign_key: true
  end
end
