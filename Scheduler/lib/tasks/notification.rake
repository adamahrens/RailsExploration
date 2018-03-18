namespace :notification do
  desc 'Sends SMS notifications to Employees ask them to log overtime'
  task sms: :environment do
    puts 'My First Rake Task!'
    # Schedule to run every Sunday
    # Iterate over all Employees (skip AdminUsers)
    # Send message with instructions & link to log time
    # Use Heroku Scheduler to daily but restrict it to be weekly executed
    if Time.now.sunday?
      employees = Employee.all
      message = "Log in to Overtime"
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        SmsTool.send_sms(number: employee.phoneNumber, message: message)
      end
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
