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
    @artworks = Artwork.new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
