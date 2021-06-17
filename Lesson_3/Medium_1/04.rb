# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # MTC the original array
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # only reassigns the array within the method
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# There is a difference between << and +.
# << will mututate the original array.
# + will concatenate the new element to the input_array variable, which is then assigned
# to the buffer variable within the method, which cannot be accessed outside the method.

# rolling_buffer1 will mutate the array via the << method from within the rolling_buffer1 method.
# rolling_buffer2 will not mututate the array outside the method. It will only return a new array.