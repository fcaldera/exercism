defmodule RomanNumerals do
  @notacion [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    do_numeral(number, "", @notacion)
  end

  defp do_numeral(0, acc, _), do: acc

  defp do_numeral(number, acc, [{value, notacion} | tail]) do
    times = div(number, value)
    acc = acc <> String.duplicate(notacion, times)
    do_numeral(rem(number, value), acc, tail)
  end
end
