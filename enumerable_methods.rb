# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    array = []
    my_each do |i|
      array << i if yield(i)
    end
    array
  end

  def my_all?
    obj = self
    obj.my_each do |i|
      return false unless yield i
      end
      true
    end
  end

  def my_any?
    my_each do |i|
      return true if yield i
      end
    end
  end

  def my_none?
    my_each do |i|
      return false if yield i
      end
    end
    true
  end
  
  def my_count
    count = 0
    my_each do |_i|
      count += 1
    end
    count
  end

  def my_map
    arr = []
    my_each do |i|
      arr << yield(i)
    end
    arr
  end

  def my_inject(value)
    my_each do |i|
      value = yield(value, i)
    end
    value
  end

  def my_map(proc = nil)
    arr = []
    unless proc.nil?
      my_each do |i|
        arr.push(proc.call(i))
      end
      my_each do |i|
        arr << yield(i)
      end
      arr
    end
  end

end
