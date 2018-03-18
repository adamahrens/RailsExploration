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

  desc 'Sends Mail notification to Managers(AdminUsers) each day to inform of pending approvals'
  task manager_mail: :environment do
    puts 'Manager Mailer Rake Task'
    # Iterate over list of pending overtime requests
    overtime = TimeOff.all.where(status: 0)
    admins = AdminUsers.all

    if overtime.count > 0
      admins.each do |manager|
        ManagerMailer.email(manager).deliver_later
      end
    end
  end
end
