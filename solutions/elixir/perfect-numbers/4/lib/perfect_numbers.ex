defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0 do
    {:error, "Classification is only possible for natural numbers."}
  end

  def classify(number) do
    sum = aliquot_sum(number)

    cond do
      sum == number -> {:ok, :perfect}
      sum > number -> {:ok, :abundant}
      true -> {:ok, :deficient}
    end
  end

  defp aliquot_sum(1), do: 0

  defp aliquot_sum(n) do
    sqrt_n = :math.sqrt(n) |> trunc()

    for i <- 2..sqrt_n//1, rem(n, i) == 0, reduce: 1 do
      acc ->
        quotient = div(n, i)
        acc + if i == quotient, do: i, else: quotient + i
    end
  end
end
