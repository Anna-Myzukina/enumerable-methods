module Enumerable
  def my_each
    i = 0
    while i < self.size
        yield(self[i])  
        i+=1      
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
       self.my_each do |i|
           if yield(i)
               array << i
           end
        end
    array
  end

  def my_all? 
    self.my_each do|i|
    unless yield i
        return false
    end    
  true
  end

  def my_any?
    self.my_each do |i|
    if yield i
        return true
    end 
  false
  end    
  
  def my_none?
    self.my_each do |i|
    if yield i
        return false
    end    
  true
  end

  def my_count
    count = 0
    self.my_each do |i|
        count += 1 if yield i == true
    end
  count
  end

  def my_map     
    arr = []
    self.my_each do |i|
     arr << yield(i)
    end
  arr 
  end

  def my_inject(value)
    self.my_each do |i| 
    value = yield(value, i)
    end
  value
  end

  def my_map(proc=nil)    
    arr = []
    if proc != nil 
      self.my_each do |i|
        arr.push(proc.call i) 
      end
      self.my_each do |i|
        arr << yield(i)
      end
    end
    arr
  end