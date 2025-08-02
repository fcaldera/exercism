defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    babylonian(radicand, 1)
  end

  defp babylonian(radicand, x0, iteration // 1)
  defp babylonian(radicand, x0, _) when x0 * x0 == radicand, do: x0

  defp babylonian(radicand, x0, iteration) do
    x1 = (x0 + radicand / x0) / 2
    babylonian(x1, radicand, iteration + 1)
  end
end
