require 'spec_helper'

RSpec.describe Flatten do
  before :all do
    @only_integer_arrays_message = 'Only integer arrays are supported'
  end

  it 'has a version number' do
    expect(Flatten::VERSION).not_to be nil
  end

  describe 'use cases' do
    it 'supports empty array as input' do
      input = []
      result = []
      expect(Flatten.to_flat(input)).to eq result
    end

    it 'supports an existing flat array as input' do
      input = [1, 2, 3]
      result = [1, 2, 3]
      expect(Flatten.to_flat(input)).to eq result
    end

    it 'supports an empty array in deeply nested arrays' do
      input = [1, 2, 3, [], [4, 5, 6, [], [7, 8, 9, [10, 11, []]]], [], []]
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
      expect(Flatten.to_flat(input)).to eq(result)
    end

    it 'flattens a simple nested array' do
      simple_array = [1, [2, [3]], 4]
      result = [1, 2, 3, 4]
      expect(Flatten.to_flat(simple_array)).to eq(result)
    end

    it 'flattens a deeply nested array' do
      complex_array = [1, [1, 2, 3, [4, 5, 6, [7, 8, 9]]]]
      result = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(Flatten.to_flat(complex_array)).to eq(result)
    end

    it 'flattens multiple deeply nested arrays' do
      multiples = [1, 2, 3, [4, 5, 6, [7, 8, 9], [10, 11, 12, [13, 14, 15, 16]]]]
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
      expect(Flatten.to_flat(multiples)).to eq(result)
    end

    it 'does not remove duplicates if any' do
      duplicate = [1, 2, [1, 2]]
      result = [1, 2, 1, 2]
      expect(Flatten.to_flat(duplicate)).to eq(result)
    end
  end

  describe 'error handling' do
    it 'catches unhandled exceptions' do
      input = [1, 2, 3]
      allow(Flatten).to receive(:validate).and_raise IndexError
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error
    end

    it 'raises an exception if the input is not an array' do
      input = 'isymphony no.9'
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error, @only_integer_arrays_message
    end

    it 'raise an exception if the input is not an integer array' do
      input = [1, 2, 'three']
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error, @only_integer_arrays_message
    end

    it 'raises an exception if the elements are not integers or arrays' do
      input = [1, 2, { some: 'hash' }]
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error, @only_integer_arrays_message
    end

    it 'raise an exception if the elements are arrays but not integers' do
      input = [1, 2, [1, 2, 3, [4, 5, 6, []]], [1, 'h', 'e', 'l', 'l', 'o']]
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error, @only_integer_arrays_message
    end

    it 'raises an exception if the elements are another type of numeric' do
      input = [1, 2, [3, 4, 4.0]]
      expect { Flatten.to_flat(input) }
        .to raise_exception Flatten::Error, @only_integer_arrays_message
    end
  end

  describe 'non-functional requirements' do
    it 'should flatten a larged nested array of integers in a reasonable time' do
      # Produces a 1.7MB and processes it in under 1 seconds
      big_array = []
      result = []
      (1..35).step do |x| # Stack nests to deep at 40
        (1..x).step { |y| y.times { result << rand(0..60_000) } }
        big_array << result
      end
      time = Benchmark.measure { Flatten.to_flat(big_array) }
      expect(time.real).to be < 1 # seconds
    end
  end
end
