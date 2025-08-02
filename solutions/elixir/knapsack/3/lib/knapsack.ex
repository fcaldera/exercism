defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value(items, maximum_weight) do
    calculate(items, maximum_weight, %{})
  end

  defp calculate(items, maximum_weight, prev) when prev == %{} do
    row = Map.from_keys(Enum.to_list(0..maximum_weight), 0)
    calculate(items, maximum_weight, row)
  end

  defp calculate([], maximum_weight, prev), do: prev[maximum_weight]

  defp calculate([item | rest], maximum_weight, prev) do
    row =
      Map.new(Enum.to_list(0..maximum_weight), fn
        0 -> {0, 0}
        weight when item.weight > weight -> {weight, prev[weight]}
        weight -> {weight, max(prev[weight], prev[weight - item.weight] + item.value)}
      end)

    calculate(rest, maximum_weight, row)
  end
end
