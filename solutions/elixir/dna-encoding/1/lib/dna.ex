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

  def encode(dna) do
    Enum.map(dna, fn x ->
      <<@codes[x]::4>>
    end)
  end

  def decode(dna) do
    # Please implement the decode/1 function
  end
end
