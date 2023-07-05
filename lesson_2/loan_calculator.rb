def prompt(message)
  Kernel.puts("=> #{message}")
end

def not_valid_amount?(num)
  true if num.to_i() == 0 || (num.zero? || num.to_i() < 0)
end

def not_valid_rate?(rate)
  true if rate.to_f() == 0 || (rate.zero? || rate.to_f() < 0)
end

def get_monthly_rate(apr)
  apr / 12
end

def get_monthly_duration(duration)
  duration * 12
end

def get_monthly_payment(loan_amount, monthly_rate, monthly_loan_duration)
  loan_amount * (monthly_rate / (1 - ((1 + monthly_rate)**(-monthly_loan_duration))))
end

# main loop
loop do
  prompt("Welcome to the loan calculator!")
  loan_amount = ''
  loop do
    prompt("What is your loan amount in US$?")
    loan_amount = gets.chomp.to_i
    if not_valid_amount?(loan_amount)
      prompt("Sorry, we can't process that.\nPlease key in a number larger than 0!")
    else
      break
    end
  end

  apr = ''
  loop do
    prompt("What is the annual percentage rate (APR)? \nKey in the percentage e.g. 5%, not 0.05")
    apr = gets.chomp.to_f / 100
    if not_valid_rate?(apr)
      prompt("That is not a valid annual loan rate. \nPlease key in a number larger than 0.0%.")
    else
      break
    end
  end

  loan_duration = ''
  loop do
    prompt("What is your loan duration in years? Round to the nearest full year.")
    loan_duration = gets.chomp.to_i
    if not_valid_amount?(loan_duration)
      prompt("Please key in the number of full years of the loan")
    else
      break
    end
  end

  prompt("Calculating your monthly payment...")

  get_monthly_rate(apr)

  get_monthly_duration(loan_duration)

  get_monthly_payment(loan_amount, get_monthly_rate, get_monthly_duration)

  prompt("Your monthly payment is $#{get_monthly_payment.truncate(2)}!")

  prompt("Would you like to calculate another loan? Press 'Y' to do so.")
  recalc = gets.chomp
  if recalc.downcase != 'y'
    prompt("Thank you for using the loan calculator. Goodbye & good luck paying it off! :)")
    break
  end
end
