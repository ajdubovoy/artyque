class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[edit layout]
  after_action :respond_with_js, only: %i[edit layout]

  def edit;end

  def layout;end

  private

  def set_artist
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end
end
