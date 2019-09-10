class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact]

  def home
    @contact_form = ContactForm.new
  end

  def contact
    @contact_form = ContactForm.new
  end
end
