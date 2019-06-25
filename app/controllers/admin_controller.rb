class AdminController < ApplicationController
  def dashboard
    @artists = Artist.all
  end
end
