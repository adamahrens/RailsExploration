number = 10
other_number = 20

if number == 10
   other_number = 3
 end

# Can put a condtional all on one line with then

if other_number == 3 then puts "Other number was 3" end

if other_number == 3 or number == 10
  puts "have a number "
end

puts other_number

# ruby allows engligh langugage or / and / not for boolen tests
# tradionatl syntax is ||, &&, and !

#unless is the opposite of if so if soemthing is false

unless number != 10
  puts "number is 10"
end

# could also throw the boolean after a statement to execute
puts other_number if other_number == 3

day = "Saturday"
working_overtime = false
if day == "Saturday" || day == "Sunday" && !working_overtime
  puts "Weekend Baby"
end
