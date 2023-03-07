# Defining the arrays
array1 = []
array2 = []
array3 = []
# Defining a counter to keep track of which array to insert the element into
counter = 1
# Defining a hash that maps the counter to the corresponding array
arrays = {
  1 => array1,
  2 => array2,
  3 => array3
}
# Defining a method to insert an element into the arrays using round-robin
def insert_element(element, counter, arrays)
  # Gettting the array to insert the element into
  array = arrays[counter]
  # Inserting the element into the array
  array << element
  # Incrementing the counter
  counter = counter % 3 + 1
  # Returning the updated counter
  return counter
end
# Inserting elements A, B, C, D, E, F into the arrays using round-robin
counter = insert_element("A", counter, arrays)
counter = insert_element("B", counter, arrays)
counter = insert_element("C", counter, arrays)
counter = insert_element("D", counter, arrays)
counter = insert_element("E", counter, arrays)
counter = insert_element("F", counter, arrays)
# Printing the arrays
puts "Array 1: #{array1.inspect}"
puts "Array 2: #{array2.inspect}"
puts "Array 3: #{array3.inspect}"