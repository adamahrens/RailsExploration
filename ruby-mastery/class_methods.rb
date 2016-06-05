class MyClass

  @instance_variable = 0
  @@class_variable = 1

  def say_hello
    puts "Good evening"
  end

  def self.say_goodnight
    puts "Good night"
  end
end


instance = MyClass.new
instance.say_hello

MyClass.say_goodnight

puts File.singleton_methods
puts '--------------'
puts String.singleton_methods
