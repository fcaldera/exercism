defmodule EliudsEggs do
  import Bitwise

  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    do_egg_count(number, 0)
  end

  defp do_egg_count(0, count), do: count

  defp do_egg_count(number, count) do
    do_egg_count(number &&& number - 1, count + 1)
  end
end
