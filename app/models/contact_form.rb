class ContactForm < MailForm::Base
  include MailForm::Delivery

  attribute :first_name,      :validate => true
  attribute :last_name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :website,     :validate => /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}\z/, allow_blank: true
  attribute :role,      :validate => ['artist', 'gallery', 'collector']

  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "New Email to Contact Form",
      :to => "info@artyque.com",
      :from => %("Contact Form Submissions" <info@artyque.com>)
      # :from => %("#{name}" <#{email}>)
    }
  end
end
