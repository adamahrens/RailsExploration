# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
100.times do |post|
  Post.create!(date: Date.today, rationale: "Time off request ##{post}")
end

puts '100 posted successfully created'
