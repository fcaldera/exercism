defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(a, _) when a == [], do: :sublist
  def compare(_, b) when b == [], do: :superlist

  def compare(a, b) do
    len_a = length(a)
    len_b = length(b)

    cond do
      len_a < len_b -> compare(a, b, len_a, len_b, :sublist)
      len_a > len_b -> compare(b, a, len_b, len_a, :superlist)
      true -> :unequal
    end
  end

  def compare(a, b, len_a, len_b, relationship) do
    s = Enum.take(b, len_a)

    result =
      cond do
        a === s -> relationship
        len_b - 1 >= len_a -> compare(a, tl(b), len_a, len_b - 1, relationship)
        true -> :unequal
      end

    unless result == :unequal, do: relationship, else: result
  end
end
