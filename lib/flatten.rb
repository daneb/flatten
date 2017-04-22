require 'flatten/version'
require 'helpers/validation'

# @author Dane Balia
# 
# Flattens an arbitrarily nested array of integers.
# 
#  @example Example 
#    [ 1, [ 2, [ 3 ] ], 4 ]  -> [ 1, 2, 3, 4 ] 
#
module Flatten
  # Validation Helper
  extend Helpers::Validation

  # Custom Error Handling
  class Error < StandardError; end

  # Private implementation
  # @private
  module Algorithm
    # @param [Array] array nested integer array
    # @param [Array] result recursive accumulator
    # @return [Array] flattened integer array with duplicates
    def self.flatten(array, result = [])
      return result if array.length.zero?
      array[0].is_a?(Array) ? flatten(array[0], result) : result << Flatten.integer?(array[0])
      flatten(array.drop(1), result)
    end
  end

  # Public method for flattening integer arrays
  # @param [Array] array nested integer array
  # @return [Array] flattened integer array 
  # @raise [ArgumentError] if input is not an integer array
  # @raise [StandardError] if unexpected error
  def self.oblate(array)
    validate array
    Algorithm.flatten array
  rescue ArgumentError
    raise Error, 'Only integer arrays are supported'
  rescue => e
    raise Error, "Unexpected error #{e.message}"
  end
end
