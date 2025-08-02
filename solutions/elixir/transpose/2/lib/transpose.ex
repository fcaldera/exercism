defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples

    iex> Transpose.transpose("ABC\\nDE")
    "AD\\nBE\\nC"

    iex> Transpose.transpose("AB\\nDEF")
    "AD\\nBE\\n F"
  """

  @pad_sign "\x00"

  @spec transpose(String.t()) :: String.t()
  def transpose(input) do
    input
    |> String.split("\n")
    |> pad_with(@pad_sign)
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&String.trim_trailing(&1, @pad_sign))
    |> Enum.map(&String.replace(&1, @pad_sign, " "))
    |> Enum.join("\n")
  end

  defp pad_with(rows, pad_sign) do
    maxlen = rows |> Enum.map(&String.length/1) |> Enum.max()
    Enum.map(rows, &String.pad_trailing(&1, maxlen, pad_sign))
  end
end
