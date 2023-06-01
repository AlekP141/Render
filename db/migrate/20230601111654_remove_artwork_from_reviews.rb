class RemoveArtworkFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :artwork, null: false, foreign_key: true
  end
end
