class AdminController < ApplicationController
  def dashboard
    authorize :admin, :dashboard?
    @artists = policy_scope(Artist).order(:name);
    @artworks_selected = policy_scope(Artwork).where(homepage_featured: true);
    @artworks_not_selected = policy_scope(Artwork).where(homepage_featured: false);
    @news_posts = policy_scope(NewsPost).all
    @categories = policy_scope(Category).all
    @contact_page = true
    @home_page_quotation = HomePageQuotation.access
  end
end
