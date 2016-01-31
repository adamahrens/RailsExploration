	# Define Class Book
	# Define Instance Variables for Title, Author, Price
	# Define Constructor to take in all params
	# Define to_s
	# Define method expensive? true if price > 20, false otherwise

	class Book
		attr_accessor :title
		attr_accessor :author
		attr_accessor :price

		def initialize(title, author, price)
			@title = title
			@author = author
			@price = price
		end

		def expensive?
			@price > 20
		end

		def to_s
			# String interpolation only works with " " quotes
			# '#{@title}' will print just that. Value of title won't be inserted
			"#{@title} by #{@author}. Price is $#{price}"
		end
	end

	book1 = Book.new("Undeniable", "Bill Nye", 17.95)
	book2 = Book.new("The Price of Inequality", "Joseph Stiglitz", 21.95)

	puts book1
	puts book2

	puts "Is #{book1.title} expensive? #{book1.expensive?}"
	puts "Is #{book2.title} expensive? #{book2.expensive?}"