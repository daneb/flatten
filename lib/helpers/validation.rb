module Helpers
  module Validation
    def validate(array)
      raise ArgumentError unless array.is_a?(Array)
      raise ArgumentError unless only_integer_or_array_elements?(array)
    end

    def only_integer_or_array_elements?(array)
      array.all? { |i| i.is_a?(Integer) || i.is_a?(Array) }
    end

    def integer?(element)
      raise ArgumentError unless element.is_a?(Integer)
      element
    end
  end
end
