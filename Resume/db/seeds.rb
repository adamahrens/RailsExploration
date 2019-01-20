# frozen_string_literal: true

require 'faker'

10.times do
  title = Faker::Hacker.abbreviation
  Topic.create!(title: title)
end

puts '10 Topics created'

20.times do |number|
  body = Faker::Lorem.paragraph(20)
  topic = Topic.order('RANDOM()').first
  Blog.create!(title: "Blog Post #{number + 1}", body: body, topic: topic)
end

puts '20 Blog posts created with Topic associations'

5.times do |number|
  Skill.create(title: "Skill #{number + 1}", proficiency: 95)
end

puts '5 Skills created'

20.times do
  body = Faker::Lorem.paragraph(10)
  title = Faker::Company.profession
  name = Faker::Company.name
  Portfolio.create(title: title,
                   subtitle: name,
                   body: body)
end

puts '20 Portfolios created'

Portfolio.all.each { |p| 3.times { p.technologies.create(name: Faker::ProgrammingLanguage.name) } }
puts 'Add 3 Technolgies to each Portfolio'
