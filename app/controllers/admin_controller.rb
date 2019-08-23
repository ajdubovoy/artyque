class AdminController < ApplicationController
  def dashboard
    authorize :admin, :dashboard?
    @artists = policy_scope(Artist).order(:name)
    @news_posts = policy_scope(NewsPost).all
  end
end
