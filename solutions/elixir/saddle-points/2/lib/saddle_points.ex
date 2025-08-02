defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(""), do: []

  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(&split_to_int/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows()
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    for {row, x} <- Enum.with_index(rows(str), 1),
        {col, y} <- Enum.with_index(columns(str), 1),
        Enum.max(row) == Enum.min(col),
        do: {x, y}
  end

  defp split_to_int(str) do
    str
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end
end
