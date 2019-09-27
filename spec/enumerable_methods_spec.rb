# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../enumerable_methods'

RSpec.describe Enumerable do
  describe '#my_each' do
    let(:array) { [1, 2, 3, 4] }
    let(:str_to_array) { %w[Hello World!] }
    let(:str) { 'Hello World!' }
    let(:result) { [] }
    it 'Return changed array' do
      expect(array.my_each { |i| result << i**2 }).to eq(array)
    end
    it 'Checking iterating each element in array' do
      expect(result).to eq([1, 4, 9, 16])
    end
    it 'Converting string to array' do
      expect(str.split.my_each { |word| result << word }).to eq(str_to_array)
    end
  end
  describe '#my_each_with_index' do
    it 'returns indexes of elements in array' do
    array.my_each_with_index { |elem, index| result << index }
       expect(result).to eql([0, 1, 2, 3])
    end
    it 'returns indexes of elements in array' do
      str_to_array = %w[Hello World!]
      result = []
      str_to_array.my_each_with_index { |elem, index| result << index}
          expect(result).to eq([0, 1])
      end 
  end
  describe '#my_select' do
    it 'returns an array containing all elements of enum for which the given block returns a true value' do
      expect([1,2,3,4,5].my_select{|num| num.even?}).to eq([2, 4])
    end
  end
end
