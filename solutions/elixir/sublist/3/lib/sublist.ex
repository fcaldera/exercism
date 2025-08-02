defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true

  defp sublist?(a, b) do
    len_a = length(a)
    len_b = length(b)

    cond do
      len_a > len_b -> false
      Enum.take(b, len_a) === a -> true
      true -> sublist?(a, tl(b))
    end
  end
end
