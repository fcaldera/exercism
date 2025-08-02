defmodule RomanNumerals do
  @notation %{
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    do_numeral(number, "")
  end

  defp do_numeral(number, acc) when number >= 1000 do
    base = div(number, 1000)
    acc = acc <> Enum.map_join(1..base, fn _ -> "M" end)
    do_numeral(rem(number, 1000), acc)
  end

  defp do_numeral(number, acc) when number >= 900 do
    do_numeral(rem(number, 900), acc <> "CM")
  end

  defp do_numeral(number, acc) when number >= 500 do
    base = div(number, 500)
    acc = acc <> Enum.map_join(1..base, fn _ -> "D" end)
    do_numeral(rem(number, 500), acc)
  end

  defp do_numeral(number, acc) when number >= 400 do
    do_numeral(rem(number, 400), acc <> "CD")
  end

  defp do_numeral(number, acc) when number >= 100 do
    base = div(number, 100)
    acc = acc <> Enum.map_join(1..base, fn _ -> "C" end)
    do_numeral(rem(number, 100), acc)
  end

  defp do_numeral(number, acc) when number >= 90 do
    do_numeral(rem(number, 90), acc <> "XC")
  end

  defp do_numeral(number, acc) when number >= 50 do
    base = div(number, 50)
    acc = acc <> Enum.map_join(1..base, fn _ -> "L" end)
    do_numeral(rem(number, 50), acc)
  end

  defp do_numeral(number, acc) when number >= 40 do
    do_numeral(rem(number, 40), acc <> "XL")
  end

  defp do_numeral(number, acc) when number >= 10 do
    base = div(number, 10)
    acc = acc <> Enum.map_join(1..base, fn _ -> "X" end)
    do_numeral(rem(number, 10), acc)
  end

  defp do_numeral(9, acc), do: acc <> "IX"

  defp do_numeral(number, acc) when number >= 5 do
    do_numeral(rem(number, 5), acc <> "V")
  end

  defp do_numeral(4, acc), do: acc <> "IV"

  defp do_numeral(number, acc) when number >= 1 do
    acc <> Enum.map_join(1..number, fn _ -> "I" end)
  end

  defp do_numeral(0, acc), do: acc
end
