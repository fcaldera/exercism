defmodule SquareRoot do
  @max_iterations 1_000

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    next(1, radicand, 1)
  end

  defp next(x0, radicand, _) when x0 * x0 == radicand, do: x0
  defp next(_, _, iteration) when iteration > @max_iterations, do: :error

  defp next(x0, radicand, iteration) do
    x1 = (x0 + radicand / x0) / 2
    next(x1, radicand, iteration + 1)
  end
end
