# Defining a RoundRobin class to handle the round-robin insertion
class RoundRobin
    def initialize(num_arrays)
        @arrays = Array.new(num_arrays) { [] }
      @counter = 0
    end
    def insert_element(element)
      # Getting the array to insert the element into
      array = @arrays[@counter]
      # Inserting the element into the array
      array << element
      # Incrementing the counter
      @counter = (@counter + 1) % @arrays.length
      # If the next array does not exist, create it
      if @arrays[@counter].nil?
        @arrays[@counter] = []
      end
    end
    def arrays
      @arrays
    end
  end
  # Creating a new RoundRobin object with 3 arrays
  round_robin = RoundRobin.new(3)
  # Inserting elements A, B, C, D, E, F into the round-robin
  round_robin.insert_element("A")
  round_robin.insert_element("B")
  round_robin.insert_element("C")
  round_robin.insert_element("D")
  round_robin.insert_element("E")
  round_robin.insert_element("F")
  # Printing the arrays
  round_robin.arrays.each_with_index do |array, index|
    puts "Array #{index+1}: #{array.inspect}"
  end