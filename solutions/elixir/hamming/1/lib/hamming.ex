defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    cond do
      length(strand1) !== length(strand2) -> {:error, "strands must be of equal length"}
      true -> {:ok, do_hamming_distance(strand1, strand2, 0)}
    end
  end

  defp do_hamming_distance([], [], acc), do: acc

  defp do_hamming_distance([h1 | t1], [h2 | t2], acc) do
    do_hamming_distance(t1, t2, acc + if(h1 !== h2, do: 1, else: 0))
  end
end
