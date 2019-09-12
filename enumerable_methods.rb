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
      my_each { |i| return false unless yield(i) }
    elsif pattern.class == Class
      my_each { |i| return false unless i.class == pattern }
    elsif pattern.class == Regexp
      my_each { |i| return false unless (i =~ pattern).is_a? Integer }
    elsif pattern.nil?
      my_each { |i| return false unless i }
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
    elsif pattern.class == Class
      my_each { |i| return false if i.class == pattern }
    elsif pattern.class == Regexp
      my_each { |i| return false if (i =~ pattern).is_a? Integer }
    elsif pattern.nil?
      my_each { |i| return false if i }
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

  def my_inject(*args)
    memo = args[0].nil? || args[0].class == Symbol ? 0 : args[0]
    symbol = args[0].class == Symbol ? args[0] : args[1].class == Symbol ? args[1] : nil
    my_each do |elem|
      memo = if symbol
               memo.send(symbol, elem)
             else
               yield(memo, elem)
             end
    end
    memo
  end

  def multiply_else(arr)
    result = arr.my_inject do |mul, num|
      mul * num
    end
    result
  end
end
