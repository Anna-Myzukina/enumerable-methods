# enumerable-methods
Project 2: Enumerable Methods from [the odin project](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks?ref=lnav#assignment-2)
* Our task is :
1. Create a script file enumerable_method.rb with our methods and run it in IRB to test them later.
1. Add our new methods onto the existing Enumerable module:
  * Example:

        module Enumerable
          def my_each
            # your code here
          end
        end

* Create next methods:
  1. Create #my_each, a method that is identical to [#each](https://ruby-doc.org/core-2.6.4/Array.html#method-i-each) but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
    * Note: #each is an iterator method that comes pre-packaged with the Array and Hash and Range classes and it basically just goes through each item in the object you called it on 
and passes it to the block that you specified. It will return the original collection that it was called on

        > [1,2,3].each { |num| print "#{num}! " }
        1! 2! 3! => [1,2,3]
  1. Create #my_each_with_index in the same way.
    * Note: If you want to know what position in the array you are #each_with_index will pass that position into the block as well

        > ["Cool", "chicken!", "beans!", "beef!"].each_with_index do |item, index|
        >   print "#{item} " if index%2==0
        > end
        Cool beans! => ["Cool", "chicken!", "beans!", "beef!"]
  1. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
    * Note: Enumerable's #select will run the block on every item of your object (whether array or hash or whatever) and return a new object that contains only those items for which the original block returned true

        > my_array.select{|item| item%2==0 }
        => [2,4,6,8,100]      # wow, that was easy.
  1. Create #my_all? (continue as above)
    * Note: method #all? returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?". Every time the block runs it must return true for this method to return true.
  1. Create #my_any?
    * Note: method #any? returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?". If your block returns true on any time it runs, any? will return true.
  1. Create #my_none?
    * Note: #none? returns true only if NONE of the elements in the object return true when the block is run.
  1. Create #my_count
    * Note: method #count returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. If a block is given, it counts the number of elements yielding a true value.
  1. Create #my_map
    * Note: method #map same method as #collect, just called something different it re-mapping your original object through some sort of transformation
method #map returns a new array filled with whatever gets returned by the block each time it runs.
method #collect will run your block and give you an object filled with whatever your block returned each time

      > my_array.collect{|num| num**2 }
      => [4,16,36,64,10000]
  1. Create #my_inject
    * Note: #inject (aka #reduce) passes not just the element but whatever was returned by the previous iteration into the block. You can either specify the initial value or it will just default to the first item of the array. It ultimately returns whatever the result of the last iteration is
  1. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
  1. Modify your #my_map method to take a proc instead.
  1. Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

### Quick Tips:

Remember yield and the #call method.

## Author :
*  [Anna-Myzukina](https://github.com/Anna-Myzukina)

