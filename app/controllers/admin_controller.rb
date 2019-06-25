class AdminController < ApplicationController
  def dashboard
    authorize :admin, :dashboard?
    @artists = policy_scope(Artist).order(:name)
  end
end
