defmodule ResistorColorDuo do
  @moduledoc false

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
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([a, b | _]) do 
    @codes[a] * 10 + @codes[b]
  end
end
