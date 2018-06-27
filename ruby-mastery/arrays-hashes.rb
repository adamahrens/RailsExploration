names = ['Daredevil', 'Wolverine', 'Batman']

names.each do |n|
  puts n
end

names.each { |n| puts n}

superheroes = { dc: ['Batman', 'Superman', 'Wonderwoman'],
                marvel: ['Daredevil', 'Wolverine', 'Captain America'] }

superheroes.each do |key, value|
  puts "Key=#{key}, Values=#{value}"
end


arr = [2, 17, 9, -7, 20, 14, -3]

puts arr.max
puts arr.min

sorted = arr.sort
puts sorted.first
puts sorted.last
