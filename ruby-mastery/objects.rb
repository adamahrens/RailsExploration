# Simple Person Object
class Person
  attr_accessor :first
  attr_accessor :last
  attr_accessor :age

  @@hair_colors = ['black', 'brown', 'blonde', 'red']

  # If provided can't simply call Person.new
  def initialize(first, last, age)
    @first = first
    @last = last
    @age = age
  end

  def self.colors
    @@hair_colors.map { |e| e.capitalize! }
  end

  def over_the_hill?
    @age > 40
  end

  def ==(other)
    @first == other.first && @last == other.last && @age == other.age
  end

  def to_s
    "#{first} #{last} has an age of #{age}"
  end
end

# Book class
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
    "#{@title}, #{@author}, $#{@price}"
  end
end

# Adding extension to String
class String
  def uppercase?
    myself = self
    myself == myself.upcase
  end
end

# person1 = Person.new
# person1.first = 'Leroy'
# person1.last = 'Jenkins'
# person1.age = 29
# puts person1

person2 = Person.new('Walter', 'Sobchak', 51)
person3 = Person.new('Walter', 'Sobchak', 51)
puts person2
puts person2.over_the_hill?
puts Person.colors

puts "ALL CAPS".uppercase?
puts "Not caps".uppercase?
puts "Is person2 == person3? #{person2 == person3}"

book1 = Book.new("End of Faith", "Sam Harris", 31)
book2 = Book.new("Harry Potter & The Order of the Phoenix", "J.K Rowling", 19)

puts book1.expensive?
puts book2.expensive?
