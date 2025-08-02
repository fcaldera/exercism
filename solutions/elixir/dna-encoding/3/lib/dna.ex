defmodule DNA do
  @codes %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @values Map.new(@codes, fn {k, v} -> {v, k} end)

  def encode_nucleotide(code_point) do
    @codes[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @values[encoded_code]
  end

  @spec encode(charlist()) :: bitstring()
  def encode(dna) do
    do_encode(dna, <<0::size(0)>>)
  end

  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    next = <<acc::bitstring, encode_nucleotide(head)::4>>
    do_encode(tail, next)
  end

  @spec decode(bitstring()) :: charlist()
  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<0::0>>, acc), do: acc

  defp do_decode(<<head::4, rest::bitstring>>, acc) do
    do_decode(rest, acc ++ [decode_nucleotide(head)])
  end
end
