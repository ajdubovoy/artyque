class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @contact_form = ContactForm.new
  end
end
