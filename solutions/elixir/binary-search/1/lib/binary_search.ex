defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    high = tuple_size(numbers) - 1
    search(numbers, key, 0, high)
  end

  defp search(_, _, low, high) when low > high, do: :not_found

  defp search(numbers, key, low, high) do
    mid = div(low + high, 2)
    guess = elem(numbers, mid)

    cond do
      key < guess -> search(numbers, key, low, mid - 1)
      key > guess -> search(numbers, key, mid + 1, high)
      true -> {:ok, mid}
    end
  end
end
