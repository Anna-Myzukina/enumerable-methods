# enumerable-methods
Project 2: Enumerable Methods from [the odin project](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks?ref=lnav#assignment-2)
* Our task is :
1. Create a script file enumerable_method.rb with our methods and run it in IRB to test them later.
1. Add our new methods onto the existing Enumerable module:
*  Example:

  module Enumerable
    def my_each
      # your code here
    end
  end

1. Create #my_each, a method that is identical to [#each](https://ruby-doc.org/core-2.6.4/Array.html#method-i-each) but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
1. Create #my_each_with_index in the same way.
1. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
1. Create #my_all? (continue as above)
1. Create #my_any?
1. Create #my_none?
1. Create #my_count
1. Create #my_map
1. Create #my_inject
1. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
1. Modify your #my_map method to take a proc instead.
1. Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

### Quick Tips:

Remember yield and the #call method.

## Author :
*  [Anna-Myzukina](https://github.com/Anna-Myzukina)

