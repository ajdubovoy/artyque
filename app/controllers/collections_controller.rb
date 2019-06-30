class CollectionsController < ApplicationController
  before_action :set_artist, only: %i[new create]
  after_action :respond_with_js, only: %i[new]

  def new
    @collection = Collection.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.artist = @artist
    authorize @collection
    if @collection.save
      respond_to do |format|
        format.html { redirect_to edit_collections_artist_path(@collection.artist) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
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

  def collection_params
    params.require(:collection).permit(:name)
  end
end
