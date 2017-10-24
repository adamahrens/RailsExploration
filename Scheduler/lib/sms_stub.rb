# Fake Stub for Sms to bypass Twilio calls
module SmsStub
  Message = Struct.new(:number, :message)
  @messages = []

  def self.send_sms(number:, message:)
    @messages << Message.new(number, message)
  end

  def self.messages
    @messages
  end
end
