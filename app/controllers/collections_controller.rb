class CollectionsController < ApplicationController
  before_action :set_artist, only: %i[new create]
  after_action :respond_with_js, only: %i[new]
  before_action :set_collection, only: %i[edit update]

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
        format.html { redirect_to edit_artist_path(@collection.artist, stage: :artworks) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def edit;end

  def update
    if @collection.update(collection_params)
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@collection.artist, stage: :artworks) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
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
    params.require(:collection).permit(
      :name,
      artworks_attributes: [
        :id,
        :title,
        :position,
        :_destroy,
      ]
    )
  end

  def set_collection
    @collection = Collection.find(params[:id])
    authorize @collection
    @artist = @collection.artist
  end
end
