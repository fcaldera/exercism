defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = to_downcase_list(base)
    Enum.filter(candidates, &anagram?(to_downcase_list(&1), base))
  end

  defp anagram?(word, base) when word == base, do: false
  defp anagram?(word, base), do: Enum.sort(word) == Enum.sort(base)

  defp to_downcase_list(word) do
    word |> String.downcase() |> String.graphemes()
  end
end
