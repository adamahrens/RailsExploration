# Add method to determine if string is a palindrome
class String
	def palindrome?
		self.downcase == self.downcase.reverse
	end
end

palindrome = "able was I ere I saw elba"
not_palindrome = "No palindrome here"

puts palindrome.palindrome?
puts not_palindrome.palindrome?

# Count all the vowels in a string
class String
	def number_of_vowels
		self.downcase.count "aeiou"
	end
end

five_vowels = "aeiou"
no_vowels = "splrr"
one_vowel = "bAng"

puts five_vowels.number_of_vowels
puts no_vowels.number_of_vowels
puts one_vowel.number_of_vowels

# Method for reducing fractions (perform the division)
def reduce_fraction(numerator, denominator)
	gcd = numerator.gcd(denominator)
	"#{numerator/gcd} / #{denominator/gcd}"
end

puts reduce_fraction(4, 24) # 1/6
puts reduce_fraction(5, 10) # 1/2
puts reduce_fraction(12, 3) # 4/1