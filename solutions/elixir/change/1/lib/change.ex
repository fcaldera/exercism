defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target)
  def generate(_, 0), do: {:ok, []}

  def generate(coins, target) do
    matrix =
      Enum.reduce(1..target, %{0 => []}, fn n, acc ->
        value = do_change(coins, n, [], acc)
        Map.put_new(acc, n, value)
      end)

    case matrix[target] do
      [] -> {:error, "cannot change"}
      change -> {:ok, Enum.sort(change)}
    end
  end

  defp do_change([], _target, prev, _), do: prev
  defp do_change([h | _t], target, prev, _) when h > target, do: prev
  defp do_change([h | _t], target, _prev, _) when h == target, do: [target]

  defp do_change([coin | tail], target, prev, matrix) do
    factor = div(target, coin)
    rest = rem(target, coin)
    change = find(matrix, rest, coin, factor, target)
    change = if(valid?(change, target), do: change, else: prev)

    cond do
      prev == [] -> do_change(tail, target, change, matrix)
      length(prev) > length(change) -> do_change(tail, target, change, matrix)
      true -> do_change(tail, target, prev, matrix)
    end
  end

  defp valid?(change, target), do: Enum.sum(change) == target

  defp find(_matrix, _rest, _coin, 0, _target), do: []

  defp find(matrix, rest, coin, factor, target) do
    change = Map.get(matrix, rest, [])

    if change == [] do
      factor = factor - 1
      rest = target - factor * coin
      find(matrix, rest, coin, factor, target)
    else
      List.duplicate(coin, factor) ++ change
    end
  end
end
