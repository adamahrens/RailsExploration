namespace :notification do
  desc 'Sends SMS notifications to Employees ask them to log overtime'
  task sms: :environment do
    puts 'My First Rake Task!'
    # Schedule to run every Sunday
    # Iterate over all Employees (skip AdminUsers)
    # Send message with instructions & link to log time
    User.all.each do |user|
      SmsTool.send_sms(number: user.phoneNumber, message: 'Hello')
    end
  end
end
