defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base)

  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}

  def convert(digits, input_base, output_base) do
    case Enum.any?(digits, fn d -> d < 0 or d >= input_base end) do
      true -> {:error, "all digits must be >= 0 and < input base"}
      false -> do_convert(digits, input_base, output_base)
    end
  end

  defp do_convert(digits, input_base, 10) do
    digits
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {n, i}, acc -> n * input_base ** i + acc end)
    |> Integer.digits()
    |> wrap_with(:ok)
  end

  defp do_convert(digits, 10, output_base) do
    digits
    |> Enum.join()
    |> String.to_integer()
    |> from_decimal([], output_base)
    |> ensure_default([0])
    |> wrap_with(:ok)
  end

  defp do_convert(digits, input_base, output_base) do
    digits
    |> do_convert(input_base, 10)
    |> then(fn {:ok, result} -> result end)
    |> do_convert(10, output_base)
  end

  defp from_decimal(0, result, _base), do: result

  defp from_decimal(number, result, base) do
    result = [rem(number, base) | result]
    next = div(number, base)
    from_decimal(next, result, base)
  end

  defp wrap_with(list, atom), do: {atom, list}

  defp ensure_default([], default), do: default
  defp ensure_default(list, _), do: list
end
