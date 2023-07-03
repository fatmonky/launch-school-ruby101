#!/usr/bin/env ruby
def prompt(message)
  Kernel.puts("=> #{message}")
end

def not_valid_number?(num)
  if num.to_i() == 0
    true
  else
    false
  end
end

# main loop

loop do
#loop if not a number
num1 = ''
loop do
  prompt("What is your first number?")
  num1 = Kernel.gets().chomp()
  if not_valid_number?(num1)
    prompt("This isn't a number: please key in a number!")
  else
    break
  end
end
num1 = num1.to_i

#loop if not a number
num2 = ''
loop do
  prompt("What is your second number?" )
  num2 = Kernel.gets().chomp()
  if not_valid_number?(num2)
    prompt("This isn't a number: please key in a number!")
  else
    break
  end
end
num2 = num2.to_i


#loop if not 1 to 4
operation = ''
loop do
  prompt("What operation to perform on both numbers? 1) add, 2) subtract, 3) multiply, 4) divide")
  operation = Kernel.gets().chomp()
  operation_set = ["1","2","3","4"]
  if operation_set.include?(operation) != true
    prompt("You must key in numbers 1 to 4")
  else
    break
  end
  operation
end

result = case operation
         when "1" then  result = num1 + num2
         when "2" then  result = num1 - num2
         when "3" then  result = num1 * num2
         when "4" then  result = num1.to_f / num2.to_f
         end
prompt("Your result is #{result}")

prompt("Would you want to do another calculation? (Y for another one)")
recalc = Kernel.gets().chomp()
if recalc.downcase != 'y'
  prompt("Thank you. Hope you liked your calculation. Goodbye!")
  break
end
end
