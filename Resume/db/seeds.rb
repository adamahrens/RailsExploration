require 'faker'

5.times do
  title = Faker::Hacker.abbreviation
  Topic.create!(title: title)
end

puts '5 Topics created'

10.times do |number|
  body = Faker::Lorem.paragraph(2)
  Blog.create!(title: "Blog Post #{number + 1}", body: body, topic: Topic.last)
end

puts '10 Blog posts created with Topic associations'

5.times do |number|
  Skill.create(title: "Skill #{number + 1}", proficiency: 95)
end

puts '5 Skills created'

9.times do
  body = Faker::Lorem.paragraph(2)
  title = Faker::Company.profession
  name = Faker::Company.name
  image = 'http://via.placeholder.com/300x300'
  thumb = 'http://via.placeholder.com/140x100'
  Portfolio.create(title: title,
                   subtitle: name,
                   body: body,
                   image: image,
                   thumbnail: thumb)
end

puts '9 Portfolios created'

4.times do
  p1 = Portfolio.last
  Technology.create(name: Faker::ProgrammingLanguage.name, portfolio: p1)

  # another way
  p2 = Portfolio.first
  p2.technologies.create(name: Faker::ProgrammingLanguage.name)
end

puts '8 Technolgies created'
