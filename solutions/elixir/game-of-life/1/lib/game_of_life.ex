defmodule GameOfLife do
  @neighbors [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  @doc """
  Apply the rules of Conway's Game of Life to a grid of cells
  """

  @spec tick(matrix :: list(list(0 | 1))) :: list(list(0 | 1))
  def tick([]), do: []

  def tick(matrix) do
    cells = to_map(matrix)

    next_gen =
      for cell <- cells, {{x, y}, status} = cell, into: %{} do
        alive = count_alive_neighbors(cells, cell)

        next_status =
          case {status, alive} do
            {1, 2} -> 1
            {1, 3} -> 1
            {0, 3} -> 1
            _ -> 0
          end

        {{x, y}, next_status}
      end

    to_matrix(next_gen)
  end

  defp count_alive_neighbors(matrix, {{x, y}, _}) do
    Enum.count(@neighbors, fn [dx, dy] ->
      Map.get(matrix, {x + dx, y + dy}) === 1
    end)
  end

  defp to_map(matrix) do
    for {row, x} <- Enum.with_index(matrix), {value, y} <- Enum.with_index(row), into: %{} do
      {{x, y}, value}
    end
  end

  defp to_matrix(map) do
    max_x = map |> Map.keys() |> Enum.map(fn {x, _} -> x end) |> Enum.max()
    max_y = map |> Map.keys() |> Enum.map(fn {_, y} -> y end) |> Enum.max()

    for x <- 0..max_x do
      for y <- 0..max_y do
        map[{x, y}]
      end
    end
  end
end
