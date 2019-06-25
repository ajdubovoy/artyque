class AdminController < ApplicationController
  def dashboard
    @artists = policy_scope Artist
  end
end
