# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adam = Employee.create(email: 'a@a.com',
  first_name: 'Adam',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119112222', ssn: 1234, company: 'ABC Company')

claudia = Employee.create(email: 'b@b.com',
  first_name: 'Claudia',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119113333', ssn: 2244, company: 'ABC Company')

admin = AdminUser.create(email: 'admin@admin.com',
  first_name: 'Admin',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119114444', ssn: 5556, company: 'ABC Company')

5.times do |index|
  now = Date.today
  time_ago = now - index
  TimeOff.create(date: time_ago, rationale: "#{index} Going on vacation", daily_hours: 0.5, user_id: adam.id)
end

5.times do |index|
  now = Date.today
  time_ago = now - index
  TimeOff.create(date: time_ago, rationale: "#{index} Going on vacation", daily_hours: 0.5, user_id: claudia.id)
end

3.times do |index|
  AuditLog.create(user_id: adam.id, start_date: Date.today - index.weeks)
end

3.times do |index|
  AuditLog.create(user_id: claudia.id, start_date: Date.today - index.weeks)
end
