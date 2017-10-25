# SmsTool to send messages via Twilio
module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  def self.send_sms(number:, message:)
    from = ENV['TWILIO_PHONE_NUMBER']
    @client.messages.create(
      from: from,
      to: "+1#{number}",
      body: "#{message} from RubyScheduler"
    )
  end
end
