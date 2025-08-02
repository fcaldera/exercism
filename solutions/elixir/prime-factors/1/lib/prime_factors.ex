defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    do_factors_for(number, 2)
  end

  defp do_factors_for(number, factor) do
    cond do
      factor > number -> []
      factor == number -> [factor]
      rem(number, factor) == 0 -> [factor | do_factors_for(div(number, factor), factor)]
      true -> do_factors_for(number, factor + 1)
    end
  end
end
