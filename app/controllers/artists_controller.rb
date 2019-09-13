class ArtistsController < ApplicationController
  include ColorPaletteHelper
  include VideoHelper
  include MarkdownHelper
  before_action :set_artist, only: %i[edit update]
  before_action :set_stage, only: %i[edit update]
  after_action :respond_with_js, only: %i[edit]
  skip_before_action :authenticate_user!, only: %i[index show] # WILL EVENTUALLY BE DISABLED WHEN PROFILES CLOSED
  after_action :skip_authorization, only: %i[index show] # WILL EVENTUALLY BE DISABLED WHEN PROFILES CLOSED

  def index
    @artists = policy_scope(Artist).all
    @featured_artist = policy_scope(Artist).where(homepage_featured: true)
    @featured_artwork = policy_scope(Artwork).where(homepage_featured: true)
  end

  def show
    @artist = Artist.find(params[:id]) # Written separately to prevent authorization
    @artworks = @artist.artworks.highlights.present? ? @artist.artworks.highlights : @artist.artworks.first(6)
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def create
    @user = User.new(user_params)
    @artist = Artist.new(artist_params)
    authorize @artist
    @artist.user = @user
    @user.role = :artist
    if @user.save && @artist.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def resume
    # For modal
    @artist = Artist.find(params[:id]) # Written separately to prevent authorization
    if request.xhr?
      # For modal update
      render json: { html: render_to_string(partial: 'artists/resume', artist: @artist) }
    end
  end

  def edit
    @artworks = @artist.artworks.highlights.present? ? @artist.artworks.highlights : @artist.artworks.first(6)
    @contact_page = true
  end

  def update
    @artworks = @artist.artworks.highlights.present? ? @artist.artworks.highlights : @artist.artworks.first(6)
    if params[:artist].include?("homepage_featured") && @artist.update(artist_params)
        respond_to do |format|
          format.html { redirect_to admin_dashboard_path }
          format.js
        end
    elsif @artist.update(artist_params)
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

  def set_stage
    # View decides which part of the form to render based on this
    @stage = params[:stage].present? ? params[:stage].to_sym : :header
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
      :homepage_featured,
      :video,
      :quotation,
      :quotation_caption,
      :photo,
      :about_me,
      :name,
      :featured_artwork_id,
      resume_blocks_attributes: [
        :id,
        :title,
        :position,
        :_destroy,
        resume_items_attributes: [
          :id,
          :description,
          :label,
          :year,
          :higlghlight,
          :position,
          :_destroy
        ]
      ],
      collections_attributes: [
        :id,
        :title,
        :position,
        artworks_attributes: [
          :id,
          :title,
          :position
        ]
      ],
      upcoming_projects_attributes: [
        :id,
        :title,
        :position
      ],
      links_attributes: [
        :id,
        :title,
        :position
      ]
    )
  end

  def user_params
    # This is written separately because the new action allows for user nested attributes and therefore should only be accessed by admins
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
