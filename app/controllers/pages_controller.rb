class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  before_action :set_form

  def home
  	@featured_artist = Artist.where(homepage_featured: true)
  end

  def about
  end

  private

  def set_form
  	@contact_form = ContactForm.new
  end
end
