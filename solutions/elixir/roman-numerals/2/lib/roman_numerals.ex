defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    do_numeral(number, "")
  end

  defp do_numeral_with(number, acc, value, notacion) do
    times = div(number, value)
    acc = acc <> String.duplicate(notacion, times)
    do_numeral(rem(number, value), acc)
  end

  defp do_numeral(number, acc) when number >= 1000 do
    do_numeral_with(number, acc, 1000, "M")
  end

  defp do_numeral(number, acc) when number >= 900 do
    do_numeral(rem(number, 900), acc <> "CM")
  end

  defp do_numeral(number, acc) when number >= 500 do
    do_numeral(rem(number, 500), acc <> "D")
  end

  defp do_numeral(number, acc) when number >= 400 do
    do_numeral(rem(number, 400), acc <> "CD")
  end

  defp do_numeral(number, acc) when number >= 100 do
    do_numeral_with(number, acc, 100, "C")
  end

  defp do_numeral(number, acc) when number >= 90 do
    do_numeral(rem(number, 90), acc <> "XC")
  end

  defp do_numeral(number, acc) when number >= 50 do
    do_numeral(rem(number, 50), acc <> "L")
  end

  defp do_numeral(number, acc) when number >= 40 do
    do_numeral(rem(number, 40), acc <> "XL")
  end

  defp do_numeral(number, acc) when number >= 10 do
    do_numeral_with(number, acc, 10, "X")
  end

  defp do_numeral(9, acc), do: acc <> "IX"

  defp do_numeral(number, acc) when number >= 5 do
    do_numeral(rem(number, 5), acc <> "V")
  end

  defp do_numeral(4, acc), do: acc <> "IV"

  defp do_numeral(number, acc) when number >= 1 do
    acc <> String.duplicate("I", number)
  end

  defp do_numeral(0, acc), do: acc
end
