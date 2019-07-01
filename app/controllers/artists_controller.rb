class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[edit layout edit_collections edit_links]
  after_action :respond_with_js, only: %i[edit layout edit_collections edit_links]

  def edit;end

  def layout;end

  def edit_collections;end

  def edit_links;end

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
