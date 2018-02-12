# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adam = User.create(email: 'a@a.com',
  first_name: 'Adam',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119112222')

claudia = User.create(email: 'b@b.com',
  first_name: 'Claudia',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119113333')

admin = AdminUser.create(email: 'admin@admin.com',
  first_name: 'Admin',
  last_name: 'Ahrens',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '9119114444')

5.times do |index|
  now = Date.today
  time_ago = now - index
  TimeOff.create(date: time_ago, rationale: "#{index} Going on vacation", overtime_request: 0.5, user_id: adam.id)
end

5.times do |index|
  now = Date.today
  time_ago = now - index
  TimeOff.create(date: time_ago, rationale: "#{index} Going on vacation", overtime_request: 0.5, user_id: claudia.id)
end

5.times do |index|
  AuditLog.create(user_id: adam.id)
end

5.times do |index|
  AuditLog.create(user_id: claudia.id)
end
