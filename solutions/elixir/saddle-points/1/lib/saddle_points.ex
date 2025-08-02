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
    str |> rows() |> transpose()
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    maxs =
      rows(str)
      |> saddle_points_with(filter: :max)
      |> MapSet.new()

    columns(str)
    |> saddle_points_with(filter: :min)
    |> Enum.map(fn {row, col} -> {col, row} end)
    |> MapSet.new()
    |> MapSet.intersection(maxs)
    |> MapSet.to_list()
    |> Enum.map(fn {row, col} -> {row + 1, col + 1} end)
  end

  defp saddle_points_with(matrix, opts) do
    matrix
    |> Enum.with_index()
    |> Enum.map(fn {value, row} ->
      value
      |> Enum.with_index()
      |> Enum.reduce({}, fn
        {value, col}, {} ->
          {value, [{row, col}]}

        {value, col}, acc when value == elem(acc, 0) ->
          {value, [{row, col} | elem(acc, 1)]}

        {value, col}, acc ->
          case opts[:filter] do
            :max -> if(value > elem(acc, 0), do: {value, [{row, col}]}, else: acc)
            :min -> if(value < elem(acc, 0), do: {value, [{row, col}]}, else: acc)
          end
      end)
    end)
    |> Enum.flat_map(&elem(&1, 1))
  end

  defp split_to_int(str) do
    str
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp transpose(matrix) do
    matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
