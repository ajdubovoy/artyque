class ArtistsController < ApplicationController
  def edit
    @artist = Artist.find(params[:id])
    authorize @artist
    respond_to do |format|
      format.html
      format.js
    end
  end
end
