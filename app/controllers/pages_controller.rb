class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :temporary]

  def home
    @contact_form = ContactForm.new
  end

  def temporary
  end
end
