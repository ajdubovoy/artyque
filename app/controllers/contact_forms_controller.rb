class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :success]

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      respond_to do |format|
        format.html { redirect_to contact_forms_success_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'pages/home' }
        format.js  # <-- idem
      end
    end
  end

  def success; end
end
