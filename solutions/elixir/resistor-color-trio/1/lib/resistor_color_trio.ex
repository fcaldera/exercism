defmodule ResistorColorTrio do
  @codes %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([a, b, n | _]) do
    value = (@codes[a] * 10 + @codes[b]) * 10 ** @codes[n]

    case value do
      x when x >= 1_000 -> {x / 1_000, :kiloohms}
      x -> {x, :ohms}
    end
  end
end
