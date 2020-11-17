#!/bin/ruby

require 'json'
require 'stringio'



#
# Complete the 'fizzBuzz' function below.
#
# The function accepts INTEGER n as parameter.
#

def fizzBuzz(n)
    # Write your code here
    
    for i in 1..n
        result_mod_3 = i % 3
        result_mod_5 = i % 5
        if result_mod_3 == 0 && result_mod_5 == 0
            puts "FizzBuzz"
        else 
            if result_mod_3 == 0
                puts "Fizz"
            elsif result_mod_5 == 0
                puts "Buzz"
            else
                puts "#{i}"    
            end
            
        end    
        
    end
    
end

n = gets.strip.to_i

fizzBuzz n
