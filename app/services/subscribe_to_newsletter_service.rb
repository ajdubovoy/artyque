class SubscribeToNewsletterService
  def initialize(email)
    @email = email
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
  end

  def call
    @gibbon.lists(@audience_id).members.create(
      body: {
        email_address: @email,
        status: "subscribed"
      }
    )
  end
end
