class LinksController < ApplicationController
  before_action :set_artist, only: %i[new create]
  after_action :respond_with_js, only: %i[new edit]
  before_action :set_link, only: %i[edit update destroy]
  include MarkdownHelper

  def new
    @link = Link.new
    authorize @link
  end

  def create
    @link = Link.new(link_params)
    @link.artist = @artist
    authorize @link
    if @link.save
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@link.artist, stage: :links) }
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
    if @link.update(link_params)
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@link.artist, stage: :links) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    if @link.destroy
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@link.artist, stage: :links) }
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
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end

  def link_params
    params.require(:link).permit(:title, :description, :url, :year, :photo)
  end

  def set_link
    @link = Link.find(params[:id])
    authorize @link
    @artist = @link.artist
  end
end
