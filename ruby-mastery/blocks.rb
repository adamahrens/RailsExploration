def fibonacci(max)
  first = 1
  second = 1

  while first <= max
    yield first
    first, second = second, first + second
  end
end

fibonacci(500) do |number|
  puts(number)
end

# Custom find
class Array
  def my_find
    each do |item|
      return item if yield item
    end
  end
end

array = [9, 10, 11, 12, 13]
puts array.my_find { |num| num > 10 }
