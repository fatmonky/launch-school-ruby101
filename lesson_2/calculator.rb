#!/usr/bin/env ruby

#Specifications:
#
#TODO: ask for two numbers
#TODO: asks for the type of operation to perform: add, subtract, multiply or divide
#TODO: displays result

Kernel.puts("List your first number: ")
num1 = Kernel.gets().chomp().to_i()
Kernel.puts("List your second number: ")
num2 = Kernel.gets().chomp().to_i()

Kernel.puts("State operation to perform on both numbers (add, subtract, multiply, divide)")
operation = Kernel.gets().chomp()


result = 0
case operation
when "add"
  result = num1 + num2
when "subtract"
  result = num1 - num2
when "multiply"
  result = num1 * num2
when "divide"
  result = num1.to_f / num2.to_f
end
Kernel.puts("Your result is #{result}")

# Given answer uses if-elsif statements, and also uses int 1-4 to represent operation choices
