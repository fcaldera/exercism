defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """
  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(0), do: []

  def matrix(n) do
    for(x <- 0..(n - 1), y <- 0..(n - 1), do: cell({x, y}, n))
    |> Enum.chunk_every(n)
  end

  defp cell(_, 0), do: []

  defp cell({x, y}, n) do
    cond do
      x == 0 -> y + 1
      y == n - 1 -> n + x
      x == n - 1 -> 3 * n - 2 - y
      y == 0 -> 4 * n - 3 - x
      true -> 4 * n - 4 + cell({x - 1, y - 1}, n - 2)
    end
  end
end
