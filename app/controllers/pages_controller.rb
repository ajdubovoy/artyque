class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  	@featured_artist = Artist.where(homepage_featured: true)
    @news_posts = NewsPost.first(4)
    @featured_artwork = Artwork.where(homepage_featured: true)
    @hidden_logo = true
  end

  def about
  end

  def contact
    @contact_form = ContactForm.new
    @contact_page = true
  end

  def privacy;end

  def impressum;end
end
