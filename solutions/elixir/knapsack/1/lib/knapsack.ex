defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(
          items :: [%{value: integer, weight: integer}],
          maximum_weight :: integer
        ) :: integer
  def maximum_value(items, maximum_weight) do
    # The first row is all zeros.
    first_row = %{0 => Map.from_keys(Enum.to_list(0..maximum_weight), 0)}

    items
    |> Enum.with_index(1)
    |> Enum.reduce(first_row, fn {item, index}, matrix ->
      prev = matrix[index - 1]

      Map.put(
        matrix,
        index,
        Map.merge(
          %{0 => 0},
          Map.new(
            Enum.map(1..maximum_weight, fn weight ->
              {weight,
               cond do
                 # If the item is too heavy, the maximum value is the same as the previous item.
                 item.weight > weight -> prev[weight]
                 # If the item is not too heavy, the maximum value is the maximum of
                 # the previous item and the value of the current item plus the
                 # maximum value of the remaining weight.
                 true -> max(prev[weight], prev[weight - item.weight] + item.value)
               end}
            end)
          )
        )
      )
    end)
    |> then(fn res -> res[length(items)][maximum_weight] end)
  end
end
