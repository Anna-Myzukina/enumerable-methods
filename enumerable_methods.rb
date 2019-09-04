module Enumerable

    #my_each
def my_each
    i = 0
    while i < self.size
        yield(self[i])  
        i+=1      
    end
    self
  end

  #my_each_with_index
def my_each_with_index
    i = 0
    each do |element|
      yield(element, i)
      i += 1
    end
  end

  #my_selected
  def my_select
    array = []
       self.my_each do |i|
           if yield(i)
               array << i
           end
       array
   end

   #my_all?
   def my_all? 
    self.my_each do|i|
    unless yield i
        return false
    end    
  
    true
end

   #my_any?
   def my_any?
    self.my_each do |i|
    if yield i
        return true
    end 
       false
    end    
  
   #my_none?
   def my_none?
    self.my_each do |i|
    if yield i
        return false
    end    
    true
end

   #my_count
   def my_count
    count = 0
    self.my_each do |0|
        count += 1 if yield i == true
    end
     count
end
   #my_map
   def my_map     
    arr = []
    self.my_each do |i|
     arr << yield i
    end
  arr 
end
   #my_inject
   def my_inject(value)
    self.my_each do |i| 
    value = yield(value, i)
    end
value
end  

end

   #multiply_els


   #my_map method to take a proc instead
   def my_map(proc=nil)
        
    arr = []
    if proc != nil 
    self.my_each do |i|
     arr.push(proc.call i) 
    
    else
    self.my_each do |i|
     arr.push(yield(i)) 
    end
  arr 
  end
   #my_map method to take either a proc or a block
   