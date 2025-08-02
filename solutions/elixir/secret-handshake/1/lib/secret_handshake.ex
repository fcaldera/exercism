defmodule SecretHandshake do
  @actions [
    {16, "reverse"},
    {8, "jump"},
    {4, "close your eyes"},
    {2, "double blink"},
    {1, "wink"}
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @actions
    |> Enum.map(fn
      {k, v} when Bitwise.&&&(code, k) !== 0 -> v
      _ -> nil
    end)
    |> Enum.reject(&is_nil/1)
    |> then(fn
      ["reverse" | tail] -> tail
      list -> Enum.reverse(list)
    end)
  end
end
