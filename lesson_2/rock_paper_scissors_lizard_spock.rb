VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]

VALID_SHORTCUTS = ["r", "p", "sc", "l", "sp"]

WINNING_MOVES = {
  "rock" => {
    "scissors" => true,
    "lizard" => true
  },
  "paper" => {
    "rock" => true,
    "spock" => true
  },
  "scissors" => {
    "paper" => true,
    "lizard" => true
  },
  "lizard" => {
    "paper" => true,
    "spock" => true
  },
  "spock" => {
    "rock" => true,
    "scissors" => true
  }
}

CHOICE_MESSAGE = <<-MSG
Choose one option:
-rock (or "r")
-paper (or "p")
-scissors (or "sc")
-lizard (or "l"')
-spock (or "sp"')

MSG

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(hash, first, second)
  hash[first][second]
end

def display_results(player, computer)
  if win?(WINNING_MOVES, player, computer)
    prompt("You won.")
  elsif win?(WINNING_MOVES, computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a draw")
  end
end

def player_choice
  choice = ''
  loop do
    prompt(CHOICE_MESSAGE)
    choice = Kernel.gets().chomp().downcase
    if (VALID_CHOICES.include?(choice) == false) &&
       (VALID_SHORTCUTS.include?(choice) == false)
      prompt("That's not a valid choice.")
    elsif VALID_SHORTCUTS.include?(choice)
      choice = VALID_CHOICES[VALID_SHORTCUTS.find_index(choice)]
      break
    elsif VALID_CHOICES.include?(choice)
      break
    end
  end
  choice
end

loop do
  choice = player_choice

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Play again? (Y to play again)")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase == 'y'
end

Kernel.system('clear')
prompt("Thank you for playing rock, paper, scissors, lizard, spock!")
