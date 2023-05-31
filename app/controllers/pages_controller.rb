class PagesController < ApplicationController
  def home
  end

  def myartworks
    @artworks = Artwork.all.select { |artwork| artwork.user_id == current_user.id }
  end
end
