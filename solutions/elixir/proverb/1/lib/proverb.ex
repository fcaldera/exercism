defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite(strings), do: do_recite(strings, [], hd(strings))

  defp do_recite([], proverb, first) do
    ["And all for the want of a #{first}.\n" | proverb]
    |> Enum.reverse()
    |> Enum.join()
  end

  defp do_recite([_head], proverb, first), do: do_recite([], proverb, first)

  defp do_recite([head | tail], proverb, first) do
    do_recite(tail, ["For want of a #{head} the #{hd(tail)} was lost.\n" | proverb], first)
  end
end
