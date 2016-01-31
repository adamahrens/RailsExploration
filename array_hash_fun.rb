# Find the least and greatest values without iterating
array = [2, 17, 9, -7, 20, 13, -3] 
puts "Least value is #{array.min}. Greatest value is #{array.max}"
min_max = array.minmax
puts "Least value is #{min_max.first}. Greatest value is #{min_max.last}"

product1 = { title: "Men's Shirt", size: "XL", cost: 21 }
product2 = { title: "Women's Shirt", size: "S", cost: 16 }
product3 = { title: "Regular Shirt", size: "M", cost: 14 }
products = [product1, product2, product3]

def items_with_cost_greater_than(products, min_cost)
	products.find_all { |product| product[:cost] > min_cost }
end

puts items_with_cost_greater_than(products, 17)

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.map! {|number| (number * 2) + 5 }
puts numbers