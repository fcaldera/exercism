defmodule VariableLengthQuantity do
  import Bitwise

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) do
    integers
    |> Enum.map(&do_encode(&1, <<>>, 0))
    |> Enum.reduce(<<>>, &(&2 <> &1))
  end

  defp do_encode(0, <<>>, _), do: <<0>>
  defp do_encode(0, acc, _), do: acc

  defp do_encode(num, acc, sign) do
    do_encode(num >>> 7, <<sign::1, num::7>> <> acc, 1)
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) do
    do_decode(bytes, [], 0)
  end

  defp do_decode(<<0::1, num::7>>, acc, partial) do
    result = [(partial <<< 7) + num | acc]
    {:ok, Enum.reverse(result)}
  end

  defp do_decode(<<1::1, _::7>>, _, _), do: {:error, "incomplete sequence"}

  defp do_decode(<<0::1, num::7, bytes::binary>>, acc, partial) do
    do_decode(bytes, [(partial <<< 7) + num | acc], 0)
  end

  defp do_decode(<<1::1, num::7, bytes::binary>>, acc, partial) do
    do_decode(bytes, acc, (partial <<< 7) + num)
  end
end
