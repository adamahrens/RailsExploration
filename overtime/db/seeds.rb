# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
@user = User.create(email: "test@test.com", password: "hello123!", password_confirmation: "hello123!", first_name: "Tony", last_name: "Stark")

100.times do |post|
  Post.create!(date: Date.today, rationale: "Time off request ##{post}", user_id: @user.id, overtime: 8.0)
end

puts '100 posted successfully created with a User'
