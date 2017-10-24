# SmsTool to send messages via Twilio
module SmsTool
  def self.send_sms(number:, message:)
    puts "Sending #{message} to #{number}"
  end
end
