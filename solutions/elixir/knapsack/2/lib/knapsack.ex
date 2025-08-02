defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(
          items :: [%{value: integer, weight: integer}],
          maximum_weight :: integer
        ) :: integer
  def maximum_value(items, maximum_weight) do
    calculate(items, maximum_weight, %{})
  end

  defp calculate(items, maximum_weight, prev) when prev == %{} do
    # The first row is always 0
    row = Map.from_keys(Enum.to_list(0..maximum_weight), 0)
    calculate(items, maximum_weight, row)
  end

  defp calculate([], maximum_weight, prev), do: prev[maximum_weight]

  defp calculate([item | rest], maximum_weight, prev) do
    row =
      Map.new(Enum.to_list(0..maximum_weight), fn
        # The first column is always 0
        0 -> {0, 0}
        # If the item is too heavy, the maximum value is the same as the previous item.
        weight when item.weight > weight -> {weight, prev[weight]}
        # If the item is not too heavy, the maximum value is the maximum of
        # the previous item and the value of the current item plus the
        # maximum value of the remaining weight.
        weight -> {weight, max(prev[weight], prev[weight - item.weight] + item.value)}
      end)

    calculate(rest, maximum_weight, row)
  end
end
