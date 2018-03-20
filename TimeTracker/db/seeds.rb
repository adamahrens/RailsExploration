# Generate Dummy Data
when_i_work = Company.create(name: 'When I Work')
thomson = Company.create(name: 'Thomson Reuters')

user = User.create(first_name: 'Adam', last_name: 'Ahrens')
other = User.create(first_name: 'Claudia', last_name: 'Ahrens')

p1 = Project.create(name: 'Project X', default_rate: 60.0)
p2 = Project.create(name: 'Orion', default_rate: 125.0)

user.company = when_i_work
other.company = thomson

p1.company = when_i_work
p2.company = thomson

user.save
other.save
p1.save
p2.save

work = Work.create(date_performed: Date.today,
  hours: 8.75,
  user_id: user.id,
project_id: p1.id)
