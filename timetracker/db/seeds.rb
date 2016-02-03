# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
smartthings = Company.new 
smartthings.name = "SmartThings"

bestbuy = Company.new
bestbuy.name = "Best Buy"

adam = User.new
adam.first_name = "Adam"
adam.last_name = "Ahrens"
adam.company = smartthings

claudia = User.new
claudia.first_name = "Claudia"
claudia.last_name = "Ahrens"
claudia.company = bestbuy

project = Project.new
project.name = "Video"
project.company = smartthings
project.default_rate = 1.0

work = Work.new
work.project = project
work.user = adam
work.date_performed = DateTime.new(2016,2, 2)
work.number_of_hours = 8

smartthings.save
bestbuy.save
adam.save
claudia.save
project.save
work.save