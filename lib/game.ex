defmodule Game do

  @game_variants ["rock", "paper", "scissors"]
  @exit_variant ["exit"]

  #Your guess function
  def your_guess() do
    guess = IO.gets("Your guess (type #{Enum.join(@game_variants, ", ")}. To exit type #{@exit_variant}): ")
            |> String.trim()

    if guess in @game_variants ++ @exit_variant do
      guess
    else
      IO.puts("Wrong type. Try again.")
      your_guess()
    end
  end

  #Computer guess function
  def computer_guess() do
    Enum.random(@game_variants)
  end

  #Get winner function
  def get_winner({"paper", "rock"}), do: :you
  def get_winner({"rock", "paper"}), do: :computer

  def get_winner({"rock", "scissors"}), do: :you
  def get_winner({"scissors", "rock"}), do: :computer

  def get_winner({"scissors", "paper"}), do: :you
  def get_winner({"paper", "scissors"}), do: :computer

  def get_winner(_), do: :draw



  #game function
  def game() do
    h_guess = your_guess()
    comp_guess = computer_guess()

    if h_guess == List.first(@exit_variant) do
      IO.puts("Bye-bye")
    else
      winner = get_winner({h_guess, comp_guess})
      IO.puts("Your guess is #{h_guess}")
      IO.puts("Computer guess is #{comp_guess}")

      if winner == :draw do
        IO.puts("Draw!")
      else
        IO.puts("Winner is #{winner}")
      end
      game()
    end
  end
end