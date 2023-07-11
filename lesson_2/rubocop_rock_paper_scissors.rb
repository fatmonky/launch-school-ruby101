VALID_CHOICES = ["rock", "paper", "scissors"]

def test_method
  prompt("test message")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won.")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a draw")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Play again? (Y to play again)")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase == 'y'
end

Kernel.system('clear')
prompt("Thank you for playing rock, paper, scissors!")
