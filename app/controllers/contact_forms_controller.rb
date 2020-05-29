class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :success]

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      SubscribeToNewsletterService.new(@contact_form.email).call
      respond_to do |format|
        format.html { redirect_to contact_forms_success_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'pages/contact' }
        format.js
      end
    end
  end

  def success; end

  def subscribe
    @email = params[:email]
    SubscribeToNewsletterService.new(@email).call
    respond_to do |format|
      format.html { redirect_to contact_forms_success_path }
      format.js
    end
  end
end
