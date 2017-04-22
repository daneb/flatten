module Helpers
  # Validation For Integer Arrays
  module Validation
    #  Validation
    #  Raises error if not an array or an array with non-integers
    #  @param [Array] array some array to validate against rules
    #  @raise [ArgumentError] if a non-integer in the array
    def validate(array)
      raise ArgumentError unless array.is_a?(Array)
      raise ArgumentError unless only_integer_or_array_elements?(array)
    end

    #  Array Verification 
    #  @param [Array] array Verifies if array consists of only integers or array elements
    def only_integer_or_array_elements?(array)
      array.all? { |i| i.is_a?(Integer) || i.is_a?(Array) }
    end

    # Element Verification
    # @param [Integer] element An element of an array
    # @raise [ArgumentError] Raises error if element is not an Integer
    def integer?(element)
      raise ArgumentError unless element.is_a?(Integer)
      element
    end
  end
end
