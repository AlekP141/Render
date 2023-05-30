class ArtworksController < ApplicationController
  def home
    @artworks = Artwork.all.sample(3)
  end

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    @artwork.save     #THIS IS NOT WORKING SINCE WE NEED THE API KEY FOR CLOUDINARY - FOR SOME REASON THIS IS NOW WORKING BUT NO IMAGE UPLOAD SINCE NO CLOUDINARY API
    redirect_to artworks_path
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :address, :description, :price, :height, :width, :photo)
  end
end
