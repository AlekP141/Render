class ArtworksController < ApplicationController
  def home
    @artworks = Artwork.all.sample(3)
    @url = "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0fGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60"
  end

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
    @booking = Booking.new
    @url = "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0fGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60"

    @markers = [{
      lat: @artwork.latitude,
      lng: @artwork.longitude
    }]
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    @artwork.save
    #THIS IS NOT WORKING SINCE WE NEED THE API KEY FOR CLOUDINARY - FOR SOME REASON THIS IS NOW WORKING BUT NO IMAGE UPLOAD SINCE NO CLOUDINARY API
    redirect_to artworks_path
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to myartworks_path, status: :see_other
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)
    redirect_to myartworks_path(@artwork)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :address, :description, :price, :height, :width, :photo)
  end
end
