class ArtistsController < ApplicationController
  def edit
    @artist = Artist.find(params[:id])
    authorize @artist
  end
end
