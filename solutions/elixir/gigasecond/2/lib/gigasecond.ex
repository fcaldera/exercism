defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from(input) do
    input
    |> NaiveDateTime.from_erl!()
    |> NaiveDateTime.add(10 ** 9, :second)
    |> NaiveDateTime.to_erl()
  end
end
