class UpcomingProjectsController < ApplicationController
  before_action :set_artist, only: %i[new create]
  after_action :respond_with_js, only: %i[new edit]
  before_action :set_upcoming_project, only: %i[edit update destroy]

  def new
    @upcoming_project = UpcomingProject.new
    authorize @upcoming_project
  end

  def create
    @upcoming_project = UpcomingProject.new(upcoming_project_params)
    @upcoming_project.artist = @artist
    authorize @upcoming_project
    if @upcoming_project.save
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@upcoming_project.artist, stage: :upcoming_projects) }
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
    if @upcoming_project.update(upcoming_project_params)
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@upcoming_project.artist, stage: :upcoming_projects) }
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
    if @upcoming_project.destroy
      respond_to do |format|
        format.html { redirect_to edit_artist_path(@upcoming_project.artist, stage: :upcoming_projects) }
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

  def upcoming_project_params
    params.require(:upcoming_project).permit(:title, :description, :location, :date, :photo)
  end

  def set_upcoming_project
    @upcoming_project = UpcomingProject.find(params[:id])
    authorize @upcoming_project
    @artist = @upcoming_project.artist
  end
end
