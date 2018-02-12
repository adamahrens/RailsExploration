# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'first@last.com',
  first_name: 'First',
  last_name: 'Last',
  password: 'password123',
  password_confirmation: 'password123',
phoneNumber: '6514085145')

10.times do |index|
  now = Date.today
  time_ago = now - index
  TimeOff.create(date: time_ago, rationale: "#{index} Going on vacation", overtime_request: 0.5, user_id: user.id)
end

10.times do |index|
  AuditLog.create(user_id: user.id, status: 0, start_date: (Date.today - 6.days))
end
