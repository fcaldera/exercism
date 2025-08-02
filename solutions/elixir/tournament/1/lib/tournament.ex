defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally([]) do
    """
    Team                           | MP |  W |  D |  L |  P
    """
    |> String.trim()
  end

  def tally(input) do
    scores =
      input
      |> Enum.reduce(%{}, &parse_line/2)
      |> Enum.sort_by(&elem(&1, 0))
      |> Enum.sort_by(&elem(elem(&1, 1), 4), :desc)

    """
    #{tally([])}
    #{Enum.map(scores, &print_line/1)}
    """
    |> String.trim()
  end

  defp parse_line(str, scores) do
    case String.split(str, ";") do
      [team1, team2, result] when result in ["win", "loss", "draw"] ->
        scores
        |> Map.get_and_update(team1, &update_scores(&1 || {0, 0, 0, 0, 0}, result))
        |> then(fn {_, new_scores} -> new_scores end)
        |> Map.get_and_update(team2, &update_scores(&1 || {0, 0, 0, 0, 0}, revert(result)))
        |> then(fn {_, new_scores} -> new_scores end)

      _ ->
        scores
    end
  end

  defp update_scores(current = {mp, w, d, l, p}, result) do
    {current,
     case result do
       "win" -> {mp + 1, w + 1, d, l, p + 3}
       "loss" -> {mp + 1, w, d, l + 1, p}
       "draw" -> {mp + 1, w, d + 1, l, p + 1}
       _ -> current
     end}
  end

  defp revert(result) do
    case result do
      "win" -> "loss"
      "loss" -> "win"
      _ -> result
    end
  end

  defp print_line({team, scores}) do
    "#{String.pad_trailing(team, 31)}|#{print_scores(scores)}\n"
  end

  defp print_scores(scores) do
    scores
    |> Tuple.to_list()
    |> Enum.map(fn score -> score |> Integer.to_string() |> String.pad_leading(3) end)
    |> Enum.join(" |")
  end
end
