require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_system
  Kernel.system("clear")
end

def not_valid_amount?(num)
  true if num.to_i() == 0 || (num.zero? || num.to_i() < 0)
end

def not_valid_rate?(rate)
  true if rate.to_f() == 0 || (rate.zero? || rate.to_f() < 0)
end

def get_monthly_rate(annual_rate)
  annual_rate.to_f / 12
end

def get_monthly_duration(duration)
  duration * 12
end

def get_monthly_payment(loan_amount, monthly_rate, monthly_loan_duration)
  loan_amount * (monthly_rate / (1 - ((1 + monthly_rate)**(-monthly_loan_duration))))
end

# main loop
loop do
  clear_system
  prompt(MESSAGES['welcome'])
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.to_i
    if not_valid_amount?(loan_amount)
      prompt(MESSAGES['invalid_loan_amount'])
    else
      break
    end
  end

  apr = ''
  loop do
    prompt(MESSAGES['annual_rate'])
    apr = gets.chomp.to_f / 100
    if not_valid_rate?(apr)
      prompt(MESSAGES['invalid_rate'])
    else
      break
    end
  end

  loan_duration = ''
  loop do
    prompt(MESSAGES['loan_duration'])
    loan_duration = gets.chomp.to_i
    if not_valid_amount?(loan_duration)
      prompt(MESSAGES['invalid_duration'])
    else
      break
    end
  end

  prompt(MESSAGES['buying_time'])

  calculated_rate = get_monthly_rate(apr)

  calculated_duration = get_monthly_duration(loan_duration)

  calc_monthly_payment = get_monthly_payment(loan_amount, calculated_rate, calculated_duration)

  prompt("Your monthly payment is $#{calc_monthly_payment.truncate(2)}!")

  prompt(MESSAGES['calculate_again'])
  recalc = gets.chomp
  clear_system

  if recalc.downcase != 'y'
    prompt(MESSAGES['farewell'])
    break
  end
end
