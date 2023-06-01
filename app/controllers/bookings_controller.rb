class BookingsController < ApplicationController
  before_action :find_artwork

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.artwork = @artwork
    @booking.save
    redirect_to artworks_path
  end

  def confirm
  end

  def destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end
end
