defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice)

  def score(:yacht, [n, n, n, n, n]), do: 50

  def score(:ones, dice), do: score_num(1, dice)
  def score(:twos, dice), do: score_num(2, dice)
  def score(:threes, dice), do: score_num(3, dice)
  def score(:fours, dice), do: score_num(4, dice)
  def score(:fives, dice), do: score_num(5, dice)
  def score(:sixes, dice), do: score_num(6, dice)

  def score(:full_house, dice) do
    case Enum.sort(dice) do
      [x, x, x, x, x] -> 0
      [x, x, y, y, y] -> Enum.sum(dice)
      [x, x, x, y, y] -> Enum.sum(dice)
      _ -> 0
    end
  end

  def score(:four_of_a_kind, dice) do
    case Enum.sort(dice) do
      [x, x, x, x, _] -> x * 4
      [_, x, x, x, x] -> x * 4
      _ -> 0
    end
  end

  def score(:little_straight, dice) do
    case Enum.sort(dice) do
      [1, 2, 3, 4, 5] -> 30
      _ -> 0
    end
  end

  def score(:big_straight, dice) do
    case Enum.sort(dice) do
      [2, 3, 4, 5, 6] -> 30
      _ -> 0
    end
  end

  def score(:choice, dice), do: Enum.sum(dice)

  def score(_, _), do: 0

  defp score_num(num, dice) do
    Enum.count(dice, &(&1 == num)) * num
  end
end
