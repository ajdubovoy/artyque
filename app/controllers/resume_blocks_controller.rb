class ResumeBlocksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index] # WILL EVENTUALLY BE DISABLED WHEN PROFILES CLOSED
  after_action :skip_authorization, only: %i[index] # WILL EVENTUALLY BE DISABLED WHEN PROFILES CLOSED
  include MarkdownHelper
  def index
    # For modal
    @artist = Artist.find(params[:artist_id]) # Not authorized
    @blocks = policy_scope @artist.resume_blocks
    if request.xhr?
      # For modal update
      render json: { html: render_to_string(partial: 'index', locals: { artist: @artist }) }
    end
  end
end
