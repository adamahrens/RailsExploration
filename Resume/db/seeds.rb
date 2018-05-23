require 'faker'

10.times do |number|
  body = Faker::Lorem.paragraph(2)
  Blog.create!(title: "Blog Post #{number + 1}", body: body)
end

puts 'Blog posts created'

5.times do |number|
  Skill.create(title: "Skill #{number + 1}", proficiency: 95)
end

puts 'Skills created'

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

puts 'Portfolio created'
