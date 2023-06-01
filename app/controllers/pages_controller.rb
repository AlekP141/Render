class PagesController < ApplicationController
  def home
  end

  def mybookings
    # @artworks = Artwork.all.select { |artwork| artwork.user_id == current_user.id }
    @bookings = current_user.bookings
    @booking = Booking.new
    @review = Review.new
  end

  def myartworks
    # @artworks = Artwork.all.select { |artwork| artwork.user_id == current_user.id }
    @artworks = current_user.artworks
  end
end
