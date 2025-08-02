defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    case length(strand1) == length(strand2) do
      true -> {:ok, Enum.zip_reduce(strand1, strand2, 0, &count_diff/3)}
      false -> {:error, "strands must be of equal length"}
    end
  end

  defp count_diff(a, b, acc) when a == b, do: acc
  defp count_diff(_a, _b, acc), do: acc + 1
end
