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
  def generate(_, target) when target < 0, do: {:error, "cannot change"}

  def generate(coins, target) do
    cache = Enum.reduce(1..target, %{0 => []}, &do_change(&1, &2, coins))

    case cache[target] do
      nil -> {:error, "cannot change"}
      change -> {:ok, change}
    end
  end

  defp do_change(target, cache, coins) do
    coins
    |> Enum.filter(fn coin -> cache[target - coin] end)
    |> Enum.map(fn coin -> [coin | cache[target - coin]] end)
    |> Enum.min_by(&length/1, fn -> nil end)
    |> then(&Map.put(cache, target, &1))
  end
end
