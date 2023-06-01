class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @artwork = Artwork.find(params[:artwork_id])
    @review.artwork = @artwork
    redirect_to artwork_path(@artwork) if @review.save
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
