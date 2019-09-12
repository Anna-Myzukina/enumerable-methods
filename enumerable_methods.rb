# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    each { |element| yield(element) }
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    array = []
    my_each { |i| array << i if yield(i) }
    array
  end

  def my_all?(pattern = nil)
    if block_given?
      my_each { |i| return false unless yield i }
    elsif !pattern.nil?
      if pattern.is_a? Regexp
        my_each { |i| return false unless pattern =~ i }
      else
        my_each { |i| return false unless i.is_a?(pattern) }
      end
    else
      my_each { |i| return false unless i == pattern }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |i| return true if yield(i) }
    elsif arg.class == Class
      my_each { |i| return true if i.class == arg }
    elsif arg.class == Regexp
      my_each { |i| return true if (i =~ arg).is_a? Integer }
    elsif arg.nil?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if i == arg }
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      my_each { |i| return false if yield(i) }
    elsif !pattern.nil?
      if pattern.is_a? Regexp
        my_each { |i| return false if pattern =~ i }
      elsif my_each { |i| return false if i.is_a?(pattern) }
      end
    else
      my_each { |i| return false if i == pattern }
    end
    true
  end

  def my_count(item = nil)
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield(i) == true }
    elsif item.nil?
      my_each { count += 1 }
    else
      my_each { |i| count += 1 if i == item }
    end
    count
  end

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given?

    new_arr = []
    my_each do |p|
      new_arr << if !proc.nil?
                   proc.call(p)
                 else
                   yield(p)
                 end
    end
    new_arr
  end

  def my_inject(arg = nil)
    my_each_with_index do |p, i|
      if i.zero? && arg.nil?
        arg = p
        next
      end
      arg = yield(arg, p)
    end
    arg
  end

  def multiply_else(arr)
    result = arr.my_inject do |mul, num|
      mul * num
    end
    result
  end
end
