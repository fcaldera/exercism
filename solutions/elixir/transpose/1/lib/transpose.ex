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

  @spec transpose(String.t()) :: String.t()
  def transpose(input) do
    input
    |> String.replace(" ", "_")
    |> String.split("\n")
    |> then(fn rows -> {rows, max_lenght(rows)} end)
    |> then(fn {rows, max_lenght} -> Enum.map(rows, &String.pad_trailing(&1, max_lenght)) end)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&String.replace(&1, "_", " "))
    |> Enum.join("\n")
  end

  defp max_lenght(rows) do
    rows |> Enum.map(&String.length/1) |> Enum.max()
  end
end
