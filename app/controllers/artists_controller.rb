class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[edit]
  after_action :respond_with_js, only: %i[edit]

  def edit
    @stage = params[:stage].present? ? params[:stage].to_sym : :header # View decides which part of the form to render based on this
  end

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
