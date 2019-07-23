class ArtworksController < ApplicationController
  before_action :set_collection, only: %i[new create]
  after_action :respond_with_js, only: %i[new edit]
  before_action :set_artwork, only: %i[edit update]

  def new
    @artwork = Artwork.new
    authorize @artwork
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.collection = @collection
    authorize @artwork
    if @artwork.save
      respond_to do |format|
        format.html { redirect_to edit_collection_path(@collection) }
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
    if @artwork.update(artwork_params)
      respond_to do |format|
        format.html { redirect_to edit_collection_path(@collection) }
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

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end

  def artwork_params
    params.require(:artwork).permit(:name, :description, :width, :height, :depth, :year, :medium, :price, :weight, :highlight)
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @collection = @artwork.collection
  end
end