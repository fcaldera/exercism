defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""

  def recite([first | rest] = strings) do
    strings
    |> Enum.zip_with(rest, fn thing, other ->
      "For want of a #{thing} the #{other} was lost.\n"
    end)
    |> Enum.join()
    |> then(fn s -> s <> "And all for the want of a #{first}.\n" end)
  end
end
