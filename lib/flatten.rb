require 'flatten/version'
require 'helpers/validation'

module Flatten
  class Error < StandardError; end

  def to_flat(array)
    Helpers::Validation.validate(array)
    flatten(array)
  rescue ArgumentError
    raise Error, 'Only integer arrays are supported'
  rescue => e
    raise Error, "Unexpected error #{e.message}"
  end

  private

  def flatten(array, result = [])
    return result if array.length.zero?
    raise ArgumentError unless Helpers::Validation.only_integer_or_array_elements?(array)
    array[0].is_a?(Array) ? flatten(array[0], result) : result << array[0]
    flatten(array.drop(1), result)
  end
end
