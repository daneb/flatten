require 'spec_helper'

RSpec.describe Flatten do
  let(:fl) { Class.new { extend Flatten } }

  before :all do
  end

  it 'has a version number' do
    expect(Flatten::VERSION).not_to be nil
  end

  describe 'use cases' do
    it 'flattens a simple nested array' do
      simple_array = [1, [2, [3]], 4]
      result = [1, 2, 3, 4]
      expect(fl.to_flat(simple_array)).to eq(result)
    end

    it 'flattens a deeply nested array' do
      complex_array = [1, [1, 2, 3, [4, 5, 6, [7, 8, 9]]]]
      result = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(fl.to_flat(complex_array)).to eq(result)
    end

    it 'flattens multiple deeply nested arrays' do
      multiples = [1, 2, 3, [4, 5, 6, [7, 8, 9], [10, 11, 12, [13, 14, 15, 16]]]]
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
      expect(fl.to_flat(multiples)).to eq(result)
    end
  end
  
  describe 'error handling' do
    it 'catches unhandled exceptions' do

    end

    it 'raises an exception if the input is not an array' do
      input = "symphony no.9"
      expect{ fl.to_flat(input) }.to raise_exception Flatten::Error, "Only integer arrays are supported"
    end

    it 'supports empty array as input' do
      input = []
      result = []
      expect(fl.to_flat(input)).to eq(result)
    end

    it 'supports an existing flat array as input' do
      input = [1, 2, 3]
      result = [1, 2, 3]
      expect(fl.to_flat(input)).to eq(result)
    end

    it 'supports an empty array in deeply nested arrays' do
      input = [1, 2, 3, [], [4, 5, 6, [], [7, 8, 9, [10, 11, []]]], [], []]
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
      expect(fl.to_flat(input)).to eq(result)
    end

  end
  
  describe 'non-functional requirements' do
  end
end
