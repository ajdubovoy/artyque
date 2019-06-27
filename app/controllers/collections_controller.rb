class CollectionsController < ApplicationController
  before_action :set_artist, only: %i[new]
  after_action :respond_with_js, only: %i[new]

  def new
    @collection = Collection.new
    authorize @collection
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end
end
