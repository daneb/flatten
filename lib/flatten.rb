require 'flatten/version'
require 'helpers/validation'

module Flatten
  module_function

  extend Helpers::Validation

  class Error < StandardError; end
  
  module Algorithm
    def self.flatten(array, result = [])
      return result if array.length.zero?
      array[0].is_a?(Array) ? flatten(array[0], result) : result << Flatten.integer?(array[0])
      flatten(array.drop(1), result)
    end
  end

  def to_flat(array)
    validate array
    Algorithm.flatten array
  rescue ArgumentError
    raise Error, 'Only integer arrays are supported'
  rescue => e
    raise Error, "Unexpected error #{e.message}"
  end
end
