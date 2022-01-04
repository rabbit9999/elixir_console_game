defmodule GameTest do
  use ExUnit.Case
  doctest Game

  #  test "greets the world" do
  #    assert Game.hello() == :world
  #  end

  test "get_winner_test" do

    assert Game.get_winner({"paper", "rock"}) == :you
    assert Game.get_winner({"rock", "scissors"}) == :you
    assert Game.get_winner({"scissors", "paper"}) == :you

    assert Game.get_winner({"rock", "paper"}) == :computer
    assert Game.get_winner({"scissors", "rock"}) == :computer
    assert Game.get_winner({"paper", "scissors"}) == :computer

    assert Game.get_winner({"paper", "paper"}) == :draw
    assert Game.get_winner({"scissors", "scissors"}) == :draw
    assert Game.get_winner({"rock", "rock"}) == :draw

  end

end
