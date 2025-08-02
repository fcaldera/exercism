defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flat(list)

  defp flat([head | tail]) when is_list(head) do
    flat(head) ++ flat(tail)
  end

  defp flat([nil | tail]), do: flat(tail)
  defp flat([head | tail]), do: [head | flat(tail)]
  defp flat(item), do: item
end
