class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    p params
    @featured_artists = Artist.where(homepage_featured: true)
    @news_posts = NewsPost.first(4)
    @featured_artwork = Artwork.where(homepage_featured: true)
    # @hidden_logo = true
    @hidden_logo = false
    @home_page_quotation = HomePageQuotation.access
    @contact_form = ContactForm.new
  end

  def about
  end

  def services
  end

  def contact
    @contact_form = ContactForm.new
    @contact_page = true
  end

  def privacy;end

  def impressum
    @contact_page = true
  end
end
