# Define the arrays with fixed size
array1 = Array.new(3)
array2 = Array.new(3)
array3 = Array.new(3)
# Defining the index for the next insertion in each array
index1 = 0
index2 = 0
index3 = 0
# Defining the elements to store
elements = ["A", "B", "C", "D", "E", "F","G","H","I"]
# Defining a counter variable to keep track of which array to insert into
c = 0
# Iterate through the elements and store them in the arrays
elements.each do |element|
  case c
  when 0
    array1[index1] = element
    index1 += 1
  when 1
    array2[index2] = element
    index2 += 1
  when 2
    array3[index3] = element
    index3 += 1
  end
  c = (c + 1) % 3
end
# Printing the contents of each array
puts "Array 1: #{array1}"
puts "Array 2: #{array2}"
puts "Array 3: #{array3}"