#Write a function that takes in an array of numbers and returns a new array with the numbers in reverse order.
#input an array of integers [1,3,5,7,14,20]
#output reversed array [20,14,7,5,3,1]

#create a function that takes an input of an array
#create an empty result array
#create an each loop
#iterate through each element, pass it into the result array in reverse
#end the loop
#return the result array

def reverse(numbers)
  reverse_numbers = []
  numbers.each do |number|
    reverse_numbers.unshift(number)
  end
  return reverse_numbers
end

#p reverse([1,3,5,7,14,20])

#Big O notation, 0(n) linear

#6) Write a function that takes in an array of numbers and returns the product of all the numbers (each number multiplied by each other). 
#input an array of integers [1,3,5,7,14,20]
#output an integers 29400

#create a function that takes an input of an array named product
#create a variable called product set it 1
#create an each loop
#iterate through each element
#multiply product by each element
#end loop
#return product

def product(numbers)
  product = 1
  numbers.each do |number|
    product *= number
  end
  return product
end

p product([1,3,5,7,14,20])