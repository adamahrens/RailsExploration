def repeat_twice
	2.times do 
		yield
	end

	# Could have just done
	# yield
	# yield
end

repeat_twice do
	puts "I'm being repeated"
end

x = 1
puts "x started as #{x}"
repeat_twice do
	x = x + 1
	puts "x is now #{x}"
end

puts "x is finally #{x}"

class Array
	def my_find
		self.each do |element|
			return element if yield(element)
		end
	end
end

numbers = [9, 10, 11, 12, 13, 14, 15, 16]
puts numbers.my_find { |number| number >  10 }     # Finds 11 first 
puts numbers.my_find { |number| number % 6 == 0 }  # Finds first number divisible by 6, which is 12