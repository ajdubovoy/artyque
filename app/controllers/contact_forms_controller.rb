class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'contact_forms/new' }
        format.js  # <-- idem
      end
    end
  end
end
