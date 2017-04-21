require "flatten/version"

module Flatten
  class Error < StandardError; end

  def to_flat(array, result = [])
    return result if array.length.zero?
    array[0].is_a?(Array) ? to_flat(array[0], result) : result << array[0]
    to_flat(array.drop(1), result)
  end
end
