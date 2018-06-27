full_name = 'Leroy Jenkins'

string1 = "Double quotes is useful for string interpolation #{full_name}"
string2 = 'Single quotes are great for no interpolation'
puts string1
puts string2
puts "What is 2 + 4 ? #{2 + 4}"


state = 'Mississippi'
puts "#{state} has how many i's? #{state.count('i')}"

puts 1.class
puts 3.14.class
puts 1000000000000000000000000000000000000000000000000.class

puts 1.odd?
puts 4.even?


class String
  def palindrome?
    downcase == downcase.reverse
  end

  def vowel_count
    downcase.count('aeiou')
  end
end

racecar = "racecar".palindrome?
puts "Is racecar a palindrome? #{racecar}"
puts "able was I ere I saw elba".palindrome?
puts "Joe Appleby".vowel_count
