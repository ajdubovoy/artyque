class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[edit update]
  after_action :respond_with_js, only: %i[edit]

  def edit
    @stage = params[:stage].present? ? params[:stage].to_sym : :header # View decides which part of the form to render based on this
  end

  def update
    if @artist.update(artist_params)
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@artist) }
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
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end

  def artist_params
    # Nested strong params. :id and :_destroy provided for cocoon gem.
    params.require(:artist).permit(
      :color_palette,
      :shape,
      :super_title,
      :title,
      :description,
      :button_text,
      :layout,
      :video,
      :quotation,
      :quotation_caption,
      :photo,
      :about_me,
      :name,
      resume_blocks: [
        :id,
        :title,
        :position,
        :_destroy,
        resume_items: [
          :id,
          :descripton,
          :label,
          :year,
          :higlghlight,
          :position,
          :_detroy
        ]
      ]
    )
  end
end
