class AddArtworkToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :artwork, null: false, foreign_key: true
  end
end
