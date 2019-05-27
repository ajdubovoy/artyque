class ContactForm < MailForm::Base
  include MailForm::Delivery

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :role,      :validate => ['artist', 'gallery', 'collector']

  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "New Email to Contact Form",
      :to => "info@artyque.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
