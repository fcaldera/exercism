defmodule Connect do
  @neighbours [{-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}]

  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t()]) :: :none | :black | :white
  def result_for(board) do
    m = length(board)
    n = hd(board) |> parse_line() |> length()

    board =
      for {line, x} <- Enum.with_index(board),
          {char, y} <- Enum.with_index(parse_line(line)),
          into: %{} do
        {{x, y}, char}
      end

    o_win =
      Enum.any?(board, fn
        {{0, y}, "O"} -> path?(board, m, {0, y}, "O")
        _ -> false
      end)

    x_win =
      !o_win and
        Enum.any?(board, fn
          {{x, 0}, "X"} -> path?(board, n, {x, 0}, "X")
          _ -> false
        end)

    cond do
      o_win -> :white
      x_win -> :black
      true -> :none
    end
  end

  defp path?(board, size, {x, y} = pos, mark) do
    case Map.get(board, pos) do
      ^mark ->
        dim = if mark == "X", do: y, else: x

        if dim >= size - 1 do
          true
        else
          board = Map.put(board, pos, "V")

          Enum.any?(@neighbours, fn
            {dx, dy} -> path?(board, size, {x + dx, y + dy}, mark)
          end)
        end

      _ ->
        false
    end
  end

  defp parse_line(line) do
    line
    |> String.replace(" ", "")
    |> String.graphemes()
  end
end
