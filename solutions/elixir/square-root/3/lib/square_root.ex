defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    babylonian(radicand)
  end

  defp babylonian(radicand, x0 \\ 1)
  defp babylonian(radicand, x0) when x0 * x0 == radicand, do: x0

  defp babylonian(radicand, x0) do
    x1 = (x0 + radicand / x0) / 2
    babylonian(radicand, x1)
  end
end
