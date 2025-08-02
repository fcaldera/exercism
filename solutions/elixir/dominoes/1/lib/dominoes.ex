defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino]) :: boolean
  def chain?([]), do: true
  def chain?([head | tail]), do: do_chain?(tail, head)

  defp do_chain?([], {a, a}), do: true
  defp do_chain?([], _), do: false

  defp do_chain?(dominoes, {a, b}) do
    dominoes
    |> Enum.any?(fn
      {^b, x} = i -> dominoes |> List.delete(i) |> do_chain?({a, x})
      {x, ^b} = i -> dominoes |> List.delete(i) |> do_chain?({a, x})
      _ -> false
    end)
  end
end
