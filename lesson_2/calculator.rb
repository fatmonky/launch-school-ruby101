require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

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

def operation_to_message(op)
  case op
  when '1' then "Adding"
  when '2' then "Subtracting"
  when '3' then "Multiplying"
  when '4' then "Dividing"
  end
end

# main loop

loop do
# loop if not a number
num1 = ''
loop do
  prompt(MESSAGES['first_number'])
  num1 = Kernel.gets().chomp()
  if not_valid_number?(num1)
    prompt(MESSAGES['invalid_number'])
  else
    break
  end
end
num1 = num1.to_i

# loop if not a number
num2 = ''
loop do
  prompt(MESSAGES['second_number'])
  num2 = Kernel.gets().chomp()
  if not_valid_number?(num2)
    prompt(MESSAGES['invalid_number'])
  else
    break
  end
end
num2 = num2.to_i

# loop if not 1 to 4
operator_prompt = <<-MSG
What operation do you want to perform?
1) add
2) subtract
3) multiply
4) divide?

MSG
operation = ''
loop do
  prompt(operator_prompt)
  operation = Kernel.gets().chomp()
  operation_set = ["1", "2", "3", "4" ]
  if operation_set.include?(operation) != true
    prompt(MESSAGES['invalid_operation'])
  else
    break
  end
  operation
end

result = case operation
         when "1" then  num1 + num2
         when "2" then  num1 - num2
         when "3" then  num1 * num2
         when "4" then  num1.to_f / num2.to_f
         end
prompt("#{operation_to_message(operation)} your numbers...")
prompt("Your result is #{result}")

prompt(MESSAGES['calculate_again'])
recalc = Kernel.gets.chomp
if recalc.downcase != 'y'
  prompt(MESSAGES['farewell'])
  break
end
end
