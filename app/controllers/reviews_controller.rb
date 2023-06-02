class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    # ratings = @review.rating
    # artwork_avg_rating = @booking.artwork.average_rating
    # number_of_ratings = @artwork.reviews.count
    # all_ratings = artwork_avg_rating * number_of_ratings
    @review.user = current_user
    @review.booking = @booking
    if @review.save
      redirect_to mybookings_path
    else
      render "pages/mybookings", status: :unprocessable_entity
    end
    # new_ratings = all_ratings + ratings
    # @new_average_rating = (new_ratings / (number_of_ratings + 1)).to_i
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
