require 'flatten/version'
require 'helpers/validation'

module Flatten
  class Error < StandardError; end

  def to_flat(array)
    Helpers::Validation.validate array
    flatten array
  rescue ArgumentError
    raise Error, 'Only integer arrays are supported'
  rescue => e
    raise Error, "Unexpected error #{e.message}"
  end

  private

  def flatten(array, result = [])
    return result if array.length.zero?
    array[0].is_a?(Array) ? flatten(array[0], result) : result << Helpers::Validation.integer?(array[0])
    flatten(array.drop(1), result)
  end
end
